/*
   Copyright (c) 2016, The Linux Foundation. All rights reserved.
   Copyright (c) 2017-2020, The LineageOS Project. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#include <android-base/logging.h>
#include <android-base/properties.h>

#include "property_service.h"

#include "init_msm8226.h"

using android::base::GetProperty;

void vendor_load_properties()
{
    std::string bootloader = GetProperty("ro.bootloader", "");

    if (bootloader.find("G386T") == 0) {
        /* afyonltetmo */
        property_override("ro.build.description", "afyonltetmo-user 4.4.2 KOT49H G386TUVU1AQD2 release-keys");
        set_ro_product_prop("device", "afyonltetmo");
        set_ro_build_prop("fingerprint", "samsung/afyonltetmo/afyonltetmo:4.4.2/KOT49H/G386TUVU1AQD2:user/release-keys");
        set_ro_product_prop("model", "SM-G386T");
        set_ro_product_prop("name", "afyonltetmo");
        gsm_properties("3", "0");
    } else if (bootloader.find("G386T1") == 0) {
        /* afyonlteMetroPCS */
        property_override("ro.build.description", "afyonlteMetroPCS-user 4.4.2 KOT49H G386T1UVU1AQD2 release-keys");
        set_ro_product_prop("device", "afyonlteMetroPCS");
        set_ro_build_prop("fingerprint", "samsung/afyonlteMetroPCS/afyonlteMetroPCS:4.4.2/KOT49H/G386T1UVU1AQD2:user/release-keys");
        set_ro_product_prop("model", "SM-G386T1");
        set_ro_product_prop("name", "afyonlteMetroPCS");
        gsm_properties("3", "1");
    } else if (bootloader.find("G386W") == 0) {
        /* afyonltecan */
        property_override("ro.build.description", "afyonltevl-user 4.4.2 KOT49H G386WVLS1AQA1 release-keys");
        set_ro_product_prop("device", "afyonltecan");
        set_ro_build_prop("fingerprint", "samsung/afyonltevl/afyonltecan:4.4.2/KOT49H/G386WVLS1AQA1:user/release-keys");
        set_ro_product_prop("model", "SM-G386W");
        set_ro_product_prop("name", "afyonltecan");
        /* property_set("ro.telephony.default_network", "9");
        property_set("telephony.lteOnGsmDevice", "1"); JJRIP from cm12 - see init_msm8226.h for the formatting. gsm_properties("3", "0") does not work*/
        gsm_properties("9", "1");
    } else {
        gsm_properties("3", "0");
    }

    std::string device = GetProperty("ro.product.device", "");
    LOG(ERROR) << "Found bootloader id " << bootloader <<  " setting build properties for "
        << device <<  " device" << std::endl;
}
