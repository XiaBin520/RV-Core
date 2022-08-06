
tool = verilator


run:
	$(tool) --trace --cc hazardCheck.v --exe tb_hazardCheck.cc
	make -C obj_dir/ -f VhazardCheck.mk VhazardCheck
	./obj_dir/VhazardCheck

clean:
	rm -rf obj_dir/