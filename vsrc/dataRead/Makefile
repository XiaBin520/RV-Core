
tool = verilator


run:
	$(tool) --trace --cc dataRead.v --exe tb_dataRead.cc
	make -C obj_dir/ -f VdataRead.mk VdataRead
	./obj_dir/VdataRead

clean:
	rm -rf obj_dir/