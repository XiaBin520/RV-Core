
tool = verilator


run:
	$(tool) --trace --cc IF_ID.v --exe tb_IF_ID.cc
	make -C obj_dir/ -f VIF_ID.mk VIF_ID
	./obj_dir/VIF_ID

clean:
	rm -rf obj_dir/