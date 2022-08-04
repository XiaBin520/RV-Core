
tool = verilator


run:
	$(tool) --trace --cc aluW.v --exe tb_aluW.cc
	make -C obj_dir/ -f ValuW.mk ValuW
	./obj_dir/ValuW

clean:
	rm -rf obj_dir/