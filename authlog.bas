Rem Linux auth.log extractor
Rem 26 nov 2024


Open "/home/nextcloud/Downloads/qb64/cloud/auth.log" For Input As #1
Open "/home/nextcloud/Downloads/qb64/cloud/temp.log" For Output As #2



Do While Not EOF(1)
    Input #1, a$
    lline = Len(a$)
    For i = 1 To lline
        If Mid$(a$, i, 32) = "Failed password for invalid user" Then
            b$ = Right$(a$, 31)
            c$ = Left$(b$, 15)
            If Left$(c$, 1) = "m" Then
                Print #2, "0.0.0.0" + Right$(c$, 14)
                Exit For
            End If

            If Left$(c$, 2) = "om" Then
                Print #2, "0.0.0.0" + Right$(c$, 13)
                Exit For
            End If
            If Left$(c$, 3) = "rom" Then
                Print #2, "0.0.0.0" + Right$(c$, 12)
                Exit For
            End If



            Print #2, "0.0.0.0 " + c$
            Exit For
        End If
    Next
Loop












