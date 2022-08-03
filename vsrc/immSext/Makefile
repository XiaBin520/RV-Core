
tool = verilator


run:
	$(tool) --trace --cc immSext.v --exe tb_immSext.cc
	make -C obj_dir/ -f VimmSext.mk VimmSext
	./obj_dir/VimmSext

clean:
	rm -rf obj_dir/