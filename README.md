Device Tree For Samsung Galaxy Core LTE
======================================= 
## Unified variants: SM-G386W , SM-G386GT , SM-G386GT1

| Basic   | Spec Sheet                  |
| -------:|:--------------------------- |
| CPU     | Quad-core 1.4 GHz Cortex-A7 | 
| CHIPSET | Qualcomm Snapdragon 400 |
| GPU     | Adreno 305 |
| Memory  | 1.5GB RAM |
| Shipped Android Version | 4.4.2 |
| Storage | 16GB |
| MicroSD | Up to 64GB |
| Battery | 2100 mAh |
| Display | 4.59in(110mm) 960x540px 240dpi |
| Camera  | 5 MP, Led flash |

![Galaxy Core LTE G386W](https://www.gsmarena.com/samsung_galaxy_core_lte_g386w-6846.php "Galaxy Core LTE G386W")

# For building Android 14
### Create `.repo/local_manifests/roomservice.xml` with the following content:

***
```xml
<?xml version="1.0" encoding="UTF-8"?>
 <manifest>
        
 <remote  name="khalvat"
    fetch="https://github.com/samsung-msm8974"
    revision="lineage-21" />

 <remote  name="linos"
    fetch="https://github.com/LineageOS"
    revision="lineage-21" />

    <!--LineageOS -->
    <project name="android_hardware_samsung" path="hardware/samsung" remote="linos" />
              
    <!--Device -->
    <project name="device_samsung_ks01lte" path="device/samsung/ks01lte" remote="khalvat" />
    <project name="device_samsung_msm8974-common" path="device/samsung/msm8974-common" remote="khalvat" />
           
    <!--Kernel -->
    <project name="kernel_samsung_msm8974" path="kernel/samsung/msm8974" remote="khalvat" />
    
    <!--Vendor -->
    <project name="vendor_samsung" path="vendor/samsung" remote="khalvat" />
                  
 </manifest>
```
