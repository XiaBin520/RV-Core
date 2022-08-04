
tool = verilator


run:
	$(tool) --trace --cc testScala.v --exe tb_testScala.cc
	make -C obj_dir/ -f VtestScala.mk VtestScala
	./obj_dir/VtestScala

clean:
	rm -rf obj_dir/