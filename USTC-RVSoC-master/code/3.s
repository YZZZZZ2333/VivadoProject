.org 0x0
 	.global _start
_start:
    or    t3, zero,zero    # t3 清零
print_hello:
    # 第一步：令t0寄存器=0x00030000，即user_uart外设的地址
    or    t0, zero,zero    # t0 清零
    lui   t0, 0x00030      # t0 寄存器的高20bit=0x00020
    
    # 第二步：将hello!逐个字符写入user_uart外设，即打印hello!到uart

    ori   t1, zero, 0x04F  # t1='O'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    ori   t1, zero, 0x070  # t1='p'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    ori   t1, zero, 0x065  # t1='e'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    ori   t1, zero, 0x06e  # t1='n'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    ori   t1, zero, 0x069  # t1='i'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    ori   t1, zero, 0x06e  # t1='n'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    ori   t1, zero, 0x067  # t1='g'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    ori   t1, zero, 0x00a  # t1='\n'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
print_vga:
    # 第一步：令t0寄存器=0x00030000，即user_vga外设的地址
    or    t0, zero,zero    # t0 清零
    lui   t0, 0x00020      # t0 寄存器的高20bit=0x00020
    
    # 第二步：将hello!逐个字符写入user_uart外设，即打印hello!到uart
    ori   t1, zero, 0x04F  # t1='O'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    addi  t0, t0  , 0x001  # t0+1
    ori   t1, zero, 0x070  # t1='p'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    addi  t0, t0  , 0x001  # t0+1
    ori   t1, zero, 0x065  # t1='e'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    addi  t0, t0  , 0x001  # t0+1
    ori   t1, zero, 0x06e  # t1='n'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    addi  t0, t0  , 0x001  # t0+1
    ori   t1, zero, 0x069  # t1='i'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    addi  t0, t0  , 0x001  # t0+1
    ori   t1, zero, 0x06e  # t1='n'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
    addi  t0, t0  , 0x001  # t0+1
    ori   t1, zero, 0x067  # t1='g'的ASCII码
    sb    t1, (t0)         # t1写入t0地址
seg:
    # 第一步：令t0寄存器=0x00031000，即user_pout_seg外设的地址
    or    t0, zero,zero    # t0 清零
    lui   t0, 0x00031      # t0 寄存器的高20bit=0x00020
    
    # 第二步：s3递增，赋值给t0对应的地址
    sw    t3, (t0)         # t1写入t0地址
    addi  t3, t3 , 0x1
    # 第三步：延时，通过大空循环的方式
    lui   t2, 0x00c00          # t2 = 0x00c00000
big_loop:
    addi  t2, t2, -1           # t2 = t2-1
    bne   t2, zero, big_loop   # if t2!=0, jmp to big_loop
    jal   zero, print_hello    # 大循环结束，跳到print_hello，重复打印
