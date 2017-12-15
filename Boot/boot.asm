;跳转到 7c00 处,此处开始是boot程序的机器码
org 0x7c00

call hello
htl

hello:
	mov ax, message
	mov bp, ax
	mov ah, 13h     ;写字符串
	mov al, 1h      ;写模式
	mov bx, 0x9     ;字符颜色
	mov cx, 0xb     ;字符长度
	mov dx, 0x0202  ;行 列
	int 10h         ;调用biso的函数

	mov ax, info
	mov bp, ax
	mov ah, 13h     ;写字符串
	mov al, 1h      ;写模式
	mov bx, 0xd     ;字符颜色
	mov cx, 0x7     ;字符长度
	mov dx, 0x0302  ;行 列
	int 10h         ;调用biso的函数
	ret
message:
	db "Hello World!"
info:
	db "HeleeOS"

;后续填充0
times 446-($-$$) db 0

;分区表填写为0
times 64 db 0

;最终两个字节必须是 55aa
dw 0xaa55