# MatriciNonSovrapponibili
[Programmazione Dichiarativa]

## Problema delle matrici non sovrapponibili.  

**Input:** quattro numeri interi N, M, Q, K  
**Problema:** dire se esistono K matrici di dimensione NxM (N righe M colonne)  
che abbiano come elementi numeri interi nell'insieme {1,2,3,4,...,Q}.  
Le K matrici devono essere a due a due non  sovrapponibili.  

Due matrici sono sovrapponibili se possono essere anche parzialmente sovrapposte.  
Per esempio, con N=3 M=5 e Q=5:  

 4 1 2 3 4  
 2 2 3 1 5   
 1 1 1 2 2  

e' sovrapponibile con  
 3 1 5 5 1  
 1 2 2 2 1  
 1 2 3 4 4  

infatti possono essere scritte in questo modo:  

 4 1 2 3 4  
 2 2 3 1 5 5 1  
 1 1 1 2 2 2 2  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1 2 3 4 4  

La sovrapposizione puo' avvenire su qualsiasi porzione delle matrici,  
anche su un "lato" o solo su un "angolo" della matrice. Per esempio la prima matrice e' sovrapponibile con la matrice  
 2 4 2 3 2  
 1 2 2 2 1  
 2 1 3 4 1  

infatti possono essere scritte in questo modo:  

 4 1 2 3 4  
 2 2 3 1 5  
 1 1 1 2 2 4 2 3 2   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1 2 2 2 1  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2 1 3 4 1  
