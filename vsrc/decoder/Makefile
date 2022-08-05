
tool = verilator


run:
	$(tool) --trace --cc decoder.v --exe tb_decoder.cc
	make -C obj_dir/ -f Vdecoder.mk Vdecoder
	./obj_dir/Vdecoder

clean:
	rm -rf obj_dir/