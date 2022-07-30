
tool = verilator


run:
	$(tool) --trace --cc alu.v --exe tb_alu.cc
	make -C obj_dir/ -f Valu.mk Valu
	./obj_dir/Valu

clean:
	rm -rf obj_dir/