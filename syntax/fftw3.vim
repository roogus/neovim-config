" Vim syntax file
" Language: C fftw3 extension (for version 3.2)
" Maintainer: David Nečas (Yeti) <yeti@physics.muni.cz>
" Last Change: 2013-07-16
" URL: http://physics.muni.cz/~yeti/vim/gtk-syntax.tar.gz

syn keyword fftw3Function fftw_cleanup fftw_cleanup_threads fftw_destroy_plan fftw_estimate_cost fftw_execute fftw_execute_dft fftw_execute_dft_c2r fftw_execute_dft_r2c fftw_execute_r2r fftw_execute_split_dft fftw_execute_split_dft_c2r fftw_execute_split_dft_r2c fftw_export_wisdom fftw_export_wisdom_to_file fftw_export_wisdom_to_string fftw_flops fftw_forget_wisdom fftw_fprint_plan fftw_free fftw_import_system_wisdom fftw_import_wisdom fftw_import_wisdom_from_file fftw_import_wisdom_from_string fftw_init_threads fftw_malloc fftw_plan_dft fftw_plan_dft_1d fftw_plan_dft_2d fftw_plan_dft_3d fftw_plan_dft_c2r fftw_plan_dft_c2r_1d fftw_plan_dft_c2r_2d fftw_plan_dft_c2r_3d fftw_plan_dft_r2c fftw_plan_dft_r2c_1d fftw_plan_dft_r2c_2d fftw_plan_dft_r2c_3d fftw_plan_guru64_dft fftw_plan_guru64_dft_c2r fftw_plan_guru64_dft_r2c fftw_plan_guru64_r2r fftw_plan_guru64_split_dft fftw_plan_guru64_split_dft_c2r fftw_plan_guru64_split_dft_r2c fftw_plan_guru_dft fftw_plan_guru_dft_c2r fftw_plan_guru_dft_r2c fftw_plan_guru_r2r fftw_plan_guru_split_dft fftw_plan_guru_split_dft_c2r fftw_plan_guru_split_dft_r2c fftw_plan_many_dft fftw_plan_many_dft_c2r fftw_plan_many_dft_r2c fftw_plan_many_r2r fftw_plan_r2r fftw_plan_r2r_1d fftw_plan_r2r_2d fftw_plan_r2r_3d fftw_plan_with_nthreads fftw_print_plan fftw_set_timelimit
syn keyword fftw3Typedef fftw_plan fftw_complex fftw_iodim fftw_iodim64 fftw_r2r_kind
syn keyword fftw3Constant FFTW_ALLOW_LARGE_GENERIC FFTW_ALLOW_PRUNING FFTW_BACKWARD FFTW_BELIEVE_PCOST FFTW_CONSERVE_MEMORY FFTW_DESTROY_INPUT FFTW_DHT FFTW_ESTIMATE FFTW_ESTIMATE_PATIENT FFTW_EXHAUSTIVE FFTW_FORWARD FFTW_HC2R FFTW_MEASURE FFTW_NO_BUFFERING FFTW_NO_DFT_R2HC FFTW_NO_FIXED_RADIX_LARGE_N FFTW_NO_INDIRECT_OP FFTW_NO_NONTHREADED FFTW_NO_RANK_SPLITS FFTW_NO_SIMD FFTW_NO_SLOW FFTW_NO_TIMELIMIT FFTW_NO_VRANK_SPLITS FFTW_NO_VRECURSE FFTW_PATIENT FFTW_PRESERVE_INPUT FFTW_R2HC FFTW_REDFT00 FFTW_REDFT01 FFTW_REDFT10 FFTW_REDFT11 FFTW_RODFT00 FFTW_RODFT01 FFTW_RODFT10 FFTW_RODFT11 FFTW_UNALIGNED FFTW_WISDOM_ONLY
syn keyword fftw3Variable fftw_version fftw_cc fftw_codelet_optim

" Default highlighting
hi def link fftw3Function Function
hi def link fftw3Typedef Type
hi def link fftw3Constant Constant

