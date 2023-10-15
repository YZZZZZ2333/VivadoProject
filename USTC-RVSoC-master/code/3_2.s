.org 0x0
 	.global _start
_start:
    or    t3, zero,zero    # t3 清零

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

print_hello:
    # 第一步：令t0寄存器=0x00030000，即user_uart外设的地址
    or    t0, zero,zero    # t0 清零
    lui   t0, 0x00010      # t0 寄存器的高20bit=0x00020
    
    # 第二步：将hello!逐个字符写入user_uart外设，即打印hello!到uart

    ori   t1, zero, 2  # t1=2
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00300
    loop1:
        addi t2, t2, -1
        bne  t2, zero, loop1
    ori   t1, zero, 0  # t1=0
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00300
    loop2:
        addi t2, t2, -1
        bne  t2, zero, loop2
    ori   t1, zero, 2  # t1=2
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00400
    loop3:
        addi t2, t2, -1
        bne  t2, zero, loop3
    ori   t1, zero, 4  # t1=4
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00400
    loop4:
        addi t2, t2, -1
        bne  t2, zero, loop4
    ori   t1, zero, 5  # t1=5
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00400
    loop5:
        addi t2, t2, -1
        bne  t2, zero, loop5
    ori   t1, zero, 4  # t1=4
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00400
    loop6:
        addi t2, t2, -1
        bne  t2, zero, loop6
    ori   t1, zero, 2  # t1=2
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00400
    loop7:
        addi t2, t2, -1
        bne  t2, zero, loop7
    ori   t1, zero, 5  # t1=5
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00400
    loop8:
        addi t2, t2, -1
        bne  t2, zero, loop8
    ori   t1, zero, 1  # t1=1
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00400
    loop9:
        addi t2, t2, -1
        bne  t2, zero, loop9
    ori   t1, zero, 5  # t1=5
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00400
    loop10:
        addi t2, t2, -1
        bne  t2, zero, loop10
    ori   t1, zero, 4  # t1=4
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00400
    loop11:
        addi t2, t2, -1
        bne  t2, zero, loop11
    ori   t1, zero, 5  # t1=5
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00400
    loop12:
        addi t2, t2, -1
        bne  t2, zero, loop12
    ori   t1, zero, 1  # t1=1
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00400
    loop13:
        addi t2, t2, -1
        bne  t2, zero, loop13
    ori   t1, zero, 0  # t1=1
    sb    t1, (t0)         # t1写入t0地址
    lui   t2, 0x00f00
    loop14:
        addi t2, t2, -1
        bne  t2, zero, loop14



    jal   zero, print_hello    # 大循环结束，跳到print_hello，重复打印
