#tag Class
Protected Class UUIDGenerator
	#tag Method, Flags = &h21
		Private Function ByteToHex(bytes() As UInt8, start As Integer, count As Integer) As String
		  // Convert a subarray of bytes into a hex string
		  
		  Var result As String
		  For i As Integer = start To start + count - 1
		    result = result + bytes(i).ToHex(2)
		  Next
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function EncodeBase64(bytes() As UInt8) As String
		  // Encode the UUID bytes in Base64
		  
		  Var mb As New MemoryBlock(bytes.Count)
		  For i As Integer = 0 To bytes.LastIndex
		    mb.UInt8Value(i) = bytes(i)
		  Next
		  Return EncodeBase64(mb)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FormatUUIDHex(bytes() As UInt8, includeHyphens As Boolean) As String
		  // Convert the 16 bytes to hexadecimal UUID format, with or without hyphens
		  
		  Var parts() As String
		  parts.Add(ByteToHex(bytes, 0, 4))
		  parts.Add(ByteToHex(bytes, 4, 2))
		  parts.Add(ByteToHex(bytes, 6, 2))
		  parts.Add(ByteToHex(bytes, 8, 2))
		  parts.Add(ByteToHex(bytes, 10, 6))
		  
		  If includeHyphens Then
		    Return Join( parts,"-")
		    
		  Else
		    Return Join( parts,"")
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GenerateRandomUUIDBytes() As UInt8()
		  // Generates an array of 16 bytes UUID v4 with compliant version and variant bits
		  
		  Var bytes() As UInt8
		  Var rnd As New Random
		  
		  For i As Integer = 0 To 15
		    bytes.Add(rnd.InRange(0, 255))
		  Next
		  
		  // Set version (4)
		  bytes(6) = Bitwise.BitAnd(bytes(6), &b00001111)
		  bytes(6) = Bitwise.BitOr(bytes(6), &b01000000)
		  
		  // Set variant (10xxxxxx)
		  bytes(8) = Bitwise.BitAnd(bytes(8), &b00111111)
		  bytes(8) = Bitwise.BitOr(bytes(8), &b10000000)
		  
		  Return bytes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateUUIDv4(outputFormat As UUIDFormat = UUIDFormat.Hex, includeHyphens As Boolean = True) As String
		  // MAIN METHOD
		  
		  Var uuidBytes() As UInt8 = GenerateRandomUUIDBytes()
		  
		  Select Case outputFormat
		  Case UUIDFormat.Hex
		    Return FormatUUIDHex(uuidBytes, includeHyphens)
		  Case UUIDFormat.Base64
		    Return EncodeBase64(uuidBytes)
		  Else
		    Return ""
		  End Select
		  
		  
		End Function
	#tag EndMethod


	#tag Enum, Name = UUIDFormat, Type = Integer, Flags = &h0
		Hex
		Base64
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
