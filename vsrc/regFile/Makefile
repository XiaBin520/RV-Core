
tool = verilator


run:
	$(tool) --trace --cc regFile.v --exe tb_regFile.cc
	make -C obj_dir/ -f VregFile.mk VregFile
	./obj_dir/VregFile

clean:
	rm -rf obj_dir/