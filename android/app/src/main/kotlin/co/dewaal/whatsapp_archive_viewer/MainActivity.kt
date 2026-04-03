package co.dewaal.whatsapp_archive_viewer

import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.StatFs
import android.os.storage.StorageManager
import android.provider.OpenableColumns
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream

class MainActivity : FlutterFragmentActivity() {
    private val channelName = "whatsbackup/share"
    private val storageChannelName = "whatsbackup/storage"
    private val methodStorageInfo = "getStorageInfo"
    private val methodConsume = "consumeSharedFiles"

    private var pendingSharedPaths: List<String> = emptyList()

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
            .setMethodCallHandler { call, result ->
                if (call.method == methodConsume) {
                    // Return pending paths once, then clear
                    val payload = pendingSharedPaths
                    pendingSharedPaths = emptyList()
                    result.success(payload)
                } else {
                    result.notImplemented()
                }
            }
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, storageChannelName)
            .setMethodCallHandler { call, result ->
                if (call.method == methodStorageInfo) {
                    val path = call.argument<String>("path")
                    if (path == null) {
                        result.error("invalid_args", "Missing path", null)
                        return@setMethodCallHandler
                    }
                    val info = getStorageInfo(path)
                    result.success(info)
                } else {
                    result.notImplemented()
                }
            }

        // Capture any share intent that launched the app
        handleShareIntent(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        handleShareIntent(intent)
    }

    private fun handleShareIntent(intent: Intent?) {
        if (intent == null) return
        val action = intent.action ?: return
        if (action != Intent.ACTION_SEND && action != Intent.ACTION_VIEW) return

        val uris = mutableListOf<Uri>()
        val clipData = intent.clipData
        if (clipData != null) {
            for (i in 0 until clipData.itemCount) {
                clipData.getItemAt(i).uri?.let { uris.add(it) }
            }
        } else {
            val streamUri = intent.getParcelableExtra<Uri>(Intent.EXTRA_STREAM)
            if (streamUri != null) {
                uris.add(streamUri)
            } else if (intent.data != null) {
                uris.add(intent.data!!)
            }
        }

        if (uris.isEmpty()) return

        val paths = mutableListOf<String>()
        for (uri in uris) {
            when (uri.scheme) {
                "file" -> paths.add(uri.path ?: continue)
                "content" -> {
                    val copied = copyContentUriToCache(uri)
                    if (copied != null) {
                        paths.add(copied.absolutePath)
                    }
                }
                else -> {
                    // Fallback: try to resolve as path string
                    uri.path?.let { paths.add(it) }
                }
            }
        }

        if (paths.isNotEmpty()) {
            pendingSharedPaths = paths
        }
    }

    private fun copyContentUriToCache(uri: Uri): File? {
        val resolver = applicationContext.contentResolver
        val name = queryDisplayName(uri) ?: "shared_${System.currentTimeMillis()}.zip"
        val safeName = if (name.endsWith(".zip", true)) name else "$name.zip"
        val outFile = File(cacheDir, safeName)

        return try {
            resolver.openInputStream(uri)?.use { input ->
                FileOutputStream(outFile).use { output ->
                    input.copyTo(output)
                }
            }
            outFile
        } catch (_: Exception) {
            null
        }
    }

    private fun queryDisplayName(uri: Uri): String? {
        val resolver = applicationContext.contentResolver
        val projection = arrayOf(OpenableColumns.DISPLAY_NAME)
        resolver.query(uri, projection, null, null, null)?.use { cursor ->
            if (cursor.moveToFirst()) {
                val idx = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME)
                if (idx >= 0) return cursor.getString(idx)
            }
        }
        return null
    }

    private fun getStorageInfo(path: String): Map<String, Any?> {
        val statFs = StatFs(path)
        val availableBytes = statFs.availableBytes
        var volumeName: String? = null
        val storageManager = getSystemService(StorageManager::class.java)
        if (storageManager != null) {
            for (volume in storageManager.storageVolumes) {
                val dir = volume.directory
                if (dir != null) {
                    try {
                        if (path.startsWith(dir.path)) {
                            volumeName = volume.getDescription(this)
                            break
                        }
                    } catch (_: Exception) {
                        // Ignore resolution errors.
                    }
                }
            }
        }
        return mapOf(
            "availableBytes" to availableBytes,
            "volumeName" to volumeName
        )
    }

}
