plugins {
    id("com.android.application")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.cp_driver_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    buildFeatures {
        resValues = true
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.example.cp_driver_app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions += "env"
    productFlavors {
        create("dev") {
            dimension = "env"
            resValue("string", "app_name", "麦卡司机端-dev")
            applicationIdSuffix = ".dev"
        }
        create("sit") {
            dimension = "env"
            resValue("string", "app_name", "麦卡司机端-sit")
            applicationIdSuffix = ".sit"
        }
        create("uat") {
            dimension = "env"
            resValue("string", "app_name", "麦卡司机端-uat")
            applicationIdSuffix = ".uat"
        }
        create("prod") {
            dimension = "env"
            resValue("string", "app_name", "麦卡司机端-prod")
            applicationIdSuffix = ".prod"
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

dependencies {
    constraints {
        implementation("org.chromium.net:cronet-api:143.7445.0") {
            // play-services-cronet still selects 141, whose api/shared AARs
            // share a namespace and fail manifest merging with AGP 9.
            because("Cronet 143 gives its AARs unique namespaces")
        }
    }
}
