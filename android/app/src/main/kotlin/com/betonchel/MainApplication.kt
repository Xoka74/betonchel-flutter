package com.betonchel.betonchel_manager

import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setApiKey("62d3b804-21ba-4111-8c48-ff28543a0dda")
    }
}