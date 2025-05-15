#!/bin/bash
function git_clone() {
  git clone --depth 1 $1 $2 || true
  }

function git_sparse_clone() {
  branch="$1" rurl="$2" localdir="$3" && shift 3
  git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
  cd $localdir
  git sparse-checkout init --cone
  git sparse-checkout set $@
  mv -n $@ ../
  cd ..
  rm -rf $localdir
  }

function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
  }

git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall && mv -n openwrt-passwall/luci-app-passwall ./; rm -rf openwrt-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 && mv -n openwrt-passwall2/luci-app-passwall2 ./; rm -rf openwrt-passwall2
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages && mvdir openwrt-passwall-packages
git clone --depth 1 https://github.com/fw876/helloworld && mv -n helloworld/luci-app-ssr-plus ./; rm -rf helloworld
git clone --depth 1 https://github.com/tty228/luci-app-wechatpush
#git clone -b openwrt-18.06 --depth 1 https://github.com/tty228/luci-app-wechatpush luci-app-serverchan
git clone --depth 1 https://github.com/sbwml/luci-app-alist alist1 && mv -n alist1/*alist ./; rm -rf alist1
git clone --depth 1 https://github.com/sbwml/luci-app-filemanager 
#git clone --depth 1 https://github.com/QiuSimons/openwrt-mos && mv -n openwrt-mos/luci-app-mosdns ./ ; rm -rf openwrt-mos
git clone --depth 1 https://github.com/sbwml/luci-app-mosdns openwrt-mos && mv -n openwrt-mos/{*mosdns,v2dat} ./; rm -rf openwrt-mos
git clone --depth 1 https://github.com/sbwml/packages_lang_golang golang
git clone --depth 1 https://github.com/immortalwrt/homeproxy luci-app-homeproxy
git clone --depth 1 https://github.com/vernesong/OpenClash && mv -n OpenClash/luci-app-openclash ./; rm -rf OpenClash
git clone --depth 1 https://github.com/destan19/OpenAppFilter && mvdir OpenAppFilter
git clone --depth 1 https://github.com/lisaac/luci-app-diskman diskman && mv -n diskman/applications/luci-app-diskman ./; rm -rf diskman
git clone --depth 1 https://github.com/lisaac/luci-app-dockerman dockerman && mv -n dockerman/applications/luci-app-dockerman ./; rm -rf dockerman
git clone --depth 1 https://github.com/lisaac/luci-lib-docker libdocker && mv -n libdocker/collections/luci-lib-docker ./; rm -rf libdocker
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon
sed -i '23,24d' luci-theme-argon/luasrc/view/themes/argon/footer.htm
sed -i '23,24d' luci-theme-argon/luasrc/view/themes/argon/footer_login.htm
#git_sparse_clone master "https://github.com/x-wrt/com.x-wrt" "x-wrt" luci-app-wizard
git clone --depth 1 https://github.com/kiddin9/luci-app-wizard
git_sparse_clone main "https://github.com/kiddin9/kwrt-packages" "kwrt-packages" luci-app-bypass
git clone --depth 1 https://github.com/kiddin9/luci-app-dnsfilter
git clone --depth 1 https://github.com/yichya/luci-app-xray
git clone --depth 1 https://github.com/liudf0716/luci-app-xfrpc
git clone --depth 1 https://github.com/lmq8267/luci-app-vnt vnt1 && mv -n vnt1/*vnt* ./; rm -rf vnt1
git clone --depth 1 https://github.com/lmq8267/luci-app-caddy caddy1 && mv -n caddy1/luci-app-caddy ./; rm -rf caddy1
#git clone --depth 1 https://github.com/lmq8267/luci-app-cloudflared
git clone --depth 1 https://github.com/lmq8267/luci-app-easytier easytier1 && mv -n easytier1/*easytier ./; rm -rf easytier1
#git clone --depth 1 https://github.com/EasyTier/luci-app-easytier easytier1 && mv -n easytier1/*easytier ./; rm -rf easytier1
git clone --depth 1 https://github.com/sirpdboy/luci-app-taskplan taskplan1 && mv -n taskplan1/luci-app-taskplan ./; rm -rf taskplan1
git clone --depth 1 https://github.com/sirpdboy/luci-app-parentcontrol
git clone --depth 1 https://github.com/sirpdboy/luci-app-eqosplus
git clone --depth 1 https://github.com/sirpdboy/luci-app-netwizard netwizard1 && mv -n netwizard1/luci-app-netwizard ./; rm -rf netwizard1
git clone --depth 1 https://github.com/nikkinikki-org/OpenWrt-nikki && mv -n OpenWrt-nikki/*nikki ./; rm -rf OpenWrt-nikki
git clone --depth 1 https://github.com/gaoyaxuan/luci-app-pushbot
#git clone --depth 1 https://github.com/gdy666/luci-app-lucky lucky1 && mv -n lucky1/*lucky ./; rm -rf lucky1
git clone --depth 1 https://github.com/sirpdboy/luci-app-lucky lucky1 && mv -n lucky1/*lucky ./; rm -rf lucky1
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go ddns-go1 && mv -n ddns-go1/*ddns-go ./; rm -rf ddns-go1
git clone --depth 1 https://github.com/sirpdboy/luci-app-partexp partexp1 && mv -n partexp1/luci-app-partexp ./; rm -rf partexp1
git clone --depth 1 https://github.com/sirpdboy/luci-app-advancedplus
git clone --depth 1 https://github.com/sirpdboy/luci-app-poweroffdevice poweroffdevice1 && mv -n poweroffdevice1/luci-app-poweroffdevice ./; rm -rf poweroffdevice1
git clone --depth 1 https://github.com/sirpdboy/luci-app-watchdog watchdog1 && mv -n watchdog1/luci-app-watchdog ./; rm -rf watchdog1
git clone --depth 1 https://github.com/asvow/luci-app-tailscale
git clone --depth 1 https://github.com/Thaolga/openwrt-nekobox && mv -n openwrt-nekobox/luci-app-nekobox ./; rm -rf openwrt-nekobox
git clone --depth 1 https://github.com/muink/openwrt-fchomo mihomo1 && mv -n mihomo1/{mihomo,luci-app-fchomo} ./; rm -rf mihomo1
git clone --depth 1 https://github.com/lwb1978/openwrt-gecoosac gecoosac1 && mv -n gecoosac1/*gecoosac ./; rm -rf gecoosac1
git clone --depth 1 https://github.com/ophub/luci-app-amlogic amlogic1 && mv -n amlogic1/luci-app-amlogic ./; rm -rf amlogic1

git_sparse_clone openwrt-24.10 "https://github.com/immortalwrt/packages" "immpack" net/zerotier
git_sparse_clone openwrt-24.10 "https://github.com/immortalwrt/luci" "immluci" applications/luci-app-zerotier
git_sparse_clone openwrt-24.10 "https://github.com/openwrt/packages" "24packages" net/curl
sed -i 's/default LIBCURL_MBEDTLS/default LIBCURL_OPENSSL/g' curl/Config.in
git_sparse_clone master "https://github.com/coolsnowwolf/packages" "ledepack" net/frp
git_sparse_clone master "https://github.com/coolsnowwolf/luci" "ledeluci" applications/luci-app-frc applications/luci-app-frps

sed -i \
-e 's?include \.\./\.\./\(lang\|devel\|net\|utils)?include $(TOPDIR)/feeds/packages/\1?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
*/Makefile

exit 0

