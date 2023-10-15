.org 0x0
 	.global _start
_start:
    or    t3, zero,zero
seg:
    # 第一步：令t0寄存器=0x00031000，即user_pout_seg外设的地址
    or    t0, zero,zero    # t0 清零
    lui   t0, 0x00031      # t0 寄存器的高20bit=0x00020
    
    # 第二步：s3递增，赋值给t0对应的地址
    sb    t3, (t0)         # t1写入t0地址
    addi  t3, t3 , 0x1
    # 第三步：延时，通过大空循环的方式
    lui   t2, 0x00c00          # t2 = 0x00c00000
big_loop:
    addi  t2, t2, -1           # t2 = t2-1
    bne   t2, zero, big_loop   # if t2!=0, jmp to big_loop
    jal   zero, seg    # 大循环结束，跳到print_hello，重复打印
