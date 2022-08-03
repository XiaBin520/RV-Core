
tool = verilator


run:
	$(tool) --trace --cc ctrlTransfer.v --exe tb_ctrlTransfer.cc
	make -C obj_dir/ -f VctrlTransfer.mk VctrlTransfer
	./obj_dir/VctrlTransfer

clean:
	rm -rf obj_dir/