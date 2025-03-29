# Xojo-UUID-Generator-Class

A lightweight Xojo class for generating RFC4122 compliant **UUID version 4** identifiers.
An application developed with xojo 2025R1.

## ✨ Features

- ✅ Generates **UUID v4** (random-based) according to RFC 4122
- ✅ Output in **Hexadecimal** (with or without hyphens)
- ✅ Output in **Base64** format
- ✅ Minimal, cross-platform Xojo class
- ✅ Suitable for desktop, web, or mobile projects

---

## 📦 Installation

Simply copy the `UUIDGenerator` class into your Xojo project. No external dependencies.

---

## 🚀 Usage

```xojo
Var gen As New UUIDGenerator

// 1. Generate standard UUID (Hex with hyphens)
Var uuid1 As String = gen.GenerateUUIDv4(UUIDGenerator.UUIDFormat.Hex, True)
MessageBox("Standard UUID: " + uuid1)
// Example: 4fa62e08-bc52-4e7f-8d3a-22c93e38f7e6

// 2. Generate compact UUID (Hex without hyphens)
Var uuid2 As String = gen.GenerateUUIDv4(UUIDGenerator.UUIDFormat.Hex, False)
MessageBox("Compact UUID: " + uuid2)
// Example: 4fa62e08bc524e7f8d3a22c93e38f7e6

// 3. Generate Base64 encoded UUID
Var uuid3 As String = gen.GenerateUUIDv4(UUIDGenerator.UUIDFormat.Base64)
MessageBox("Base64 UUID: " + uuid3)
// Example: T6YuCLxSTn+NOiLJPjj35g==


