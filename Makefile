PROJ=rubberband

EMCCFLAGS=-s ALLOW_MEMORY_GROWTH=1 -s EXPORTED_FUNCTIONS="['_malloc', '_free', '_rubberband_new', '_rubberband_delete', '_rubberband_reset', '_rubberband_get_engine_version', '_rubberband_set_time_ratio', '_rubberband_set_pitch_scale', '_rubberband_get_time_ratio', '_rubberband_get_pitch_scale', '_rubberband_set_formant_scale', '_rubberband_get_formant_scale', '_rubberband_get_preferred_start_pad', '_rubberband_get_start_delay','_rubberband_get_latency','_rubberband_set_transients_option', '_rubberband_set_detector_option', '_rubberband_set_phase_option', '_rubberband_set_formant_option', '_rubberband_set_pitch_option', '_rubberband_set_expected_input_duration', '_rubberband_get_samples_required', '_rubberband_set_max_process_size', '_rubberband_set_key_frame_map', '_rubberband_study', '_rubberband_process', '_rubberband_available', '_rubberband_retrieve', '_rubberband_get_channel_count', '_rubberband_calculate_stretch', '_rubberband_set_debug_level', '_rubberband_set_default_debug_level']" -s EXPORTED_RUNTIME_METHODS="['getValue', 'setValue', 'cwrap']" -s MODULARIZE=1 -s EXPORT_ES6=1 -s EXPORT_NAME="Rubberband"

all: rubberband/single/RubberBandSingle.cpp
	emcc $(EMCCFLAGS) -O3 -o $(PROJ).js -I rubberband/rubberband $^

.PHONY: clean
clean:
	rm -f $(PROJ).js $(PROJ).wasm
