
tool = verilator


run:
	$(tool) --trace --cc ctrlCore.v --exe tb_ctrlCore.cc
	make -C obj_dir/ -f VctrlCore.mk VctrlCore
	./obj_dir/VctrlCore

clean:
	rm -rf obj_dir/