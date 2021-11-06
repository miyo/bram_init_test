quartus_map --read_settings_files=on --write_settings_files=off memtest -c memtest
quartus_fit --read_settings_files=off --write_settings_files=off memtest -c memtest
quartus_asm --read_settings_files=off --write_settings_files=off memtest -c memtest
quartus_sta memtest -c memtest
quartus_eda --read_settings_files=off --write_settings_files=off memtest -c memtest
