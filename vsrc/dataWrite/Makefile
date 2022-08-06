
tool = verilator


run:
	$(tool) --trace --cc dataWrite.v --exe tb_dataWrite.cc
	make -C obj_dir/ -f VdataWrite.mk VdataWrite
	./obj_dir/VdataWrite

clean:
	rm -rf obj_dir/