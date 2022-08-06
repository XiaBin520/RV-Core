
tool = verilator


run:
	$(tool) --trace --cc instrRead.v --exe tb_instrRead.cc
	make -C obj_dir/ -f VinstrRead.mk VinstrRead
	./obj_dir/VinstrRead

clean:
	rm -rf obj_dir/