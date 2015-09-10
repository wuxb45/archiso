# wuxb: install skel
mkdir -p ${work_dir}/${arch}/airootfs/etc/skel
git clone https://github.com/wuxb45/MyConfig.git ${work_dir}/MyConfig
${work_dir}/MyConfig/install.sh ${work_dir}/${arch}/airootfs/etc/skel ${work_dir}/MyConfig
