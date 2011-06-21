FasdUAS 1.101.10   ��   ��    k             l     ��  ��    %  Excel Spreadsheet to CSV Files     � 	 	 >   E x c e l   S p r e a d s h e e t   t o   C S V   F i l e s   
  
 l     ��  ��    %  by Scott Wilcox <scott@dor.ky>     �   >   b y   S c o t t   W i l c o x   < s c o t t @ d o r . k y >      l     ��  ��    / ) https://github.com/dordotky/applescripts     �   R   h t t p s : / / g i t h u b . c o m / d o r d o t k y / a p p l e s c r i p t s      l     ��������  ��  ��        l     ��  ��    C = Get the filename of the Excel Spreadsheet we're going to use     �   z   G e t   t h e   f i l e n a m e   o f   t h e   E x c e l   S p r e a d s h e e t   w e ' r e   g o i n g   t o   u s e      l    	 ����  r     	    l      ����   I    ���� !
�� .sysostdfalis    ��� null��   ! �� "��
�� 
prmp " m     # # � $ $ P S e l e c t   t h e   E x c e l   S p r e a d s h e e t   t o   C o n v e r t :��  ��  ��    o      ���� 0 thefile theFile��  ��     % & % l     ��������  ��  ��   &  ' ( ' l     �� ) *��   ) 4 . The directory that will contain our CSV files    * � + + \   T h e   d i r e c t o r y   t h a t   w i l l   c o n t a i n   o u r   C S V   f i l e s (  , - , l  
  .���� . r   
  / 0 / l  
  1���� 1 I  
 ���� 2
�� .sysostflalis    ��� null��   2 �� 3��
�� 
prmp 3 m     4 4 � 5 5 6 S e l e c t   F o l d e r   t o   O u t p u t   T o :��  ��  ��   0 o      ���� "0 outputdirectory outputDirectory��  ��   -  6 7 6 l   � 8���� 8 O    � 9 : 9 k    � ; ;  < = < l   �� > ?��   >   Get Excel to activate    ? � @ @ ,   G e t   E x c e l   t o   a c t i v a t e =  A B A I   ������
�� .miscactvnull��� ��� null��  ��   B  C D C l   ��������  ��  ��   D  E F E l   �� G H��   G , & Close any workbooks that we have open    H � I I L   C l o s e   a n y   w o r k b o o k s   t h a t   w e   h a v e   o p e n F  J K J I   %�� L��
�� .coreclosnull���    obj  L 2   !��
�� 
X141��   K  M N M l  & &��������  ��  ��   N  O P O l  & &�� Q R��   Q 0 * Ask Excel to open the theFile spreadsheet    R � S S T   A s k   E x c e l   t o   o p e n   t h e   t h e F i l e   s p r e a d s h e e t P  T U T I  & +�� V��
�� .aevtodocnull  �    alis V o   & '���� 0 thefile theFile��   U  W X W l  , ,��������  ��  ��   X  Y Z Y l  , ,�� [ \��   [ B < Set maxCount to the total number of sheets in this workbook    \ � ] ] x   S e t   m a x C o u n t   t o   t h e   t o t a l   n u m b e r   o f   s h e e t s   i n   t h i s   w o r k b o o k Z  ^ _ ^ r   , 7 ` a ` I  , 5�� b��
�� .corecnte****       **** b n   , 1 c d c 2  / 1��
�� 
XwSH d 1   , /��
�� 
1172��   a o      ���� 0 maxcount maxCount _  e f e l  8 8��������  ��  ��   f  g h g l  8 8�� i j��   i C = For each sheet in the workbook, loop through then one by one    j � k k z   F o r   e a c h   s h e e t   i n   t h e   w o r k b o o k ,   l o o p   t h r o u g h   t h e n   o n e   b y   o n e h  l m l Y   8 � n�� o p�� n k   B � q q  r s r Z   B Q t u���� t ?   B E v w v o   B C���� 0 i   w m   C D����  u I  H M�� x��
�� .aevtodocnull  �    alis x o   H I���� 0 thefile theFile��  ��  ��   s  y z y l  R R��������  ��  ��   z  { | { l  R R�� } ~��   } 5 / Set the current worksheet to our loop position    ~ �   ^   S e t   t h e   c u r r e n t   w o r k s h e e t   t o   o u r   l o o p   p o s i t i o n |  � � � r   R ` � � � n   R \ � � � 1   X \��
�� 
pnam � n   R X � � � 4   U X�� �
�� 
XwSH � o   V W���� 0 i   � 1   R U��
�� 
1172 � o      ���� $0 theworksheetname theWorksheetname �  � � � r   a k � � � n   a g � � � 4   d g�� �
�� 
XwSH � o   e f���� 0 i   � 1   a d��
�� 
1172 � o      ���� 0 theworksheet theWorksheet �  � � � I  l s�� ���
�� .smXLxACTnull���   6 4001 � o   l o���� 0 theworksheet theWorksheet��   �  � � � l  t t��������  ��  ��   �  � � � l  t t�� � ���   � ' ! Save the worksheet as a CSV file    � � � � B   S a v e   t h e   w o r k s h e e t   a s   a   C S V   f i l e �  � � � r   t � � � � c   t � � � � b   t } � � � b   t y � � � o   t u���� "0 outputdirectory outputDirectory � o   u x���� $0 theworksheetname theWorksheetname � m   y | � � � � �  . c s v � m   } ���
�� 
TEXT � o      ���� 0 thesheetspath theSheetsPath �  � � � I  � ��� � �
�� .smXL1659null���   7 X128 � o   � ����� 0 theworksheet theWorksheet � �� � �
�� 
5016 � o   � ����� 0 thesheetspath theSheetsPath � �� � �
�� 
1813 � m   � ���
�� e188�  � �� ���
�� 
5321 � m   � ���
�� boovtrue��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � 2 , Close the worksheet that we've just created    � � � � X   C l o s e   t h e   w o r k s h e e t   t h a t   w e ' v e   j u s t   c r e a t e d �  ��� � I  � ��� � �
�� .coreclosnull���    obj  � 1   � ���
�� 
1172 � �� ���
�� 
savo � m   � ���
�� savono  ��  ��  �� 0 i   o m   ; <����  p o   < =���� 0 maxcount maxCount��   m  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �   Clean up and close files    � � � � 2   C l e a n   u p   a n d   c l o s e   f i l e s �  ��� � I  � ��� ���
�� .coreclosnull���    obj  � 2  � ���
�� 
X141��  ��   : m     � �
                                                                                  XCEL  alis    �  Macintosh HD               ɷѥH+   ��Microsoft Excel.app                                             J�Ț�E        ����  	                Microsoft Office 2011     ɷÕ      Ț�5     �� RWP  EMacintosh HD:Applications: Microsoft Office 2011: Microsoft Excel.app   (  M i c r o s o f t   E x c e l . a p p    M a c i n t o s h   H D  6Applications/Microsoft Office 2011/Microsoft Excel.app  / ��  ��  ��   7  ��� � l     �������  ��  �  ��       �~ � ��~   � �}
�} .aevtoappnull  �   � **** � �| ��{�z � ��y
�| .aevtoappnull  �   � **** � k     � � �   � �  , � �  6�x�x  �{  �z   � �w�w 0 i   � �v #�u�t 4�s�r ��q�p�o�n�m�l�k�j�i�h�g�f ��e�d�c�b�a�`�_�^�]�\
�v 
prmp
�u .sysostdfalis    ��� null�t 0 thefile theFile
�s .sysostflalis    ��� null�r "0 outputdirectory outputDirectory
�q .miscactvnull��� ��� null
�p 
X141
�o .coreclosnull���    obj 
�n .aevtodocnull  �    alis
�m 
1172
�l 
XwSH
�k .corecnte****       ****�j 0 maxcount maxCount
�i 
pnam�h $0 theworksheetname theWorksheetname�g 0 theworksheet theWorksheet
�f .smXLxACTnull���   6 4001
�e 
TEXT�d 0 thesheetspath theSheetsPath
�c 
5016
�b 
1813
�a e188� 
�` 
5321�_ 
�^ .smXL1659null���   7 X128
�] 
savo
�\ savono  �y �*��l E�O*��l E�O� �*j O*�-j 
O�j O*�,�-j E�O yk�kh  �k 
�j Y hO*�,��/a ,E` O*�,��/E` O_ j O�_ %a %a &E` O_ a _ a a a ea  O*�,a a l 
[OY��O*�-j 
Uascr  ��ޭ