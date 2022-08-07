
tool = verilator


run:
	$(tool) --trace --cc CoreCtrl.v --exe tb_CoreCtrl.cc
	make -C obj_dir/ -f VCoreCtrl.mk VCoreCtrl
	./obj_dir/VCoreCtrl

clean:
	rm -rf obj_dir/