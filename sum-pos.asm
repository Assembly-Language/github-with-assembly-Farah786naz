include irvine32.inc 
.data 
array SWORD -3,-6,-1,-10,10,30,40,4
msg db "The sum of all positive numbers is: ",0
msg1 db "The total positive numbers are: ",0
var1 Dword 0;
TotalPositive byte 0;
.code 
main proc 
        mov eax,0
        mov ebx,0
	 	mov esi,OFFSET array 
	 	mov ecx,lengthof array 
 	 next: 
        mov ax,WORD PTR [esi]
	 	test ax,8000h                ;8000h=(8)16 = (1000)2
                                     ;      (0)16 = (0000)2
                                     ;      (0)16 = (0000)2
                                     ;      (0)16 = (0000)2 
	 	jnz moveTonext               ; will move to next index if the zero flag is not set(incase is there is negative value)

        add bx,ax                    ;will only add the positive number incase the moveTonext doesnt work
        inc TotalPositive            ;will increment the counter if the counter if there is poditive number

	 	 moveTonext:
                        add esi,TYPE array  	   ;let this move to next index
 	                    loop next                  ;will continue the loop

        mov edx,offset msg
        call writestring
        call crlf              
        movzx eax,bx                  
        mov var1,eax
        call writeint

        call crlf
        mov edx,offset msg1
        call writestring
        call crlf              
        movzx eax,TotalPositive                  
        call writeint                
        exit
main endp
end main
