
tool = verilator


run:
	$(tool) --trace --cc IDStage.v --exe tb_IDStage.cc
	make -C obj_dir/ -f VIDStage.mk VIDStage
	./obj_dir/VIDStage

clean:
	rm -rf obj_dir/