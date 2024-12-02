include irvine32.inc 
.data 
array SWORD 11,8,3,4,6,9,1,2
msg db "The sum of all odd numbers is: ",0
msg1 db "The total odd numbers are: ",0
var1 Dword 0;
Totaleven byte 0;
.code 
main proc 
        mov eax,0
        mov ebx,0
	 	mov esi,OFFSET array 
	 	mov ecx,lengthof array 
 	 next: 
        mov ax,WORD PTR [esi]
	 	test ax,1                ;8000h=(8)16 = (1000)2
                                     ;      (0)16 = (0000)2
                                     ;      (0)16 = (0000)2
                                     ;      (0)16 = (0000)2 
	 	jz moveTonext               ; will move to next index if the zero flag is set(incase is there is even value)

        
        add bx,ax                   ;will only add the odd number incase the moveTonext doesnt work
        inc Totaleven            ;will increment the counter if the counter if there is odd number

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
        movzx eax,Totaleven                  
        call writeint                
        exit
main endp
end main
