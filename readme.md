
# Graphgen

A tool to generate ascii graphs, based on Graph::Easy.

# Downloads

- [Graphgen for Linux](https://bintray.com/aaubry/graphgen/graphgen)
- [Graphgen for Windows](https://ci.appveyor.com/project/aaubry/graphgen/build/artifacts)

# Examples

## Command line syntax

```
graphgen abc def . def ghi . ghi jkl . mno . pqr
```
output:
```
+-----+     +-----+     +-----+     +-----+
| abc | --> | def | --> | ghi | --> | jkl |
+-----+     +-----+     +-----+     +-----+
+-----+
| mno |
+-----+
+-----+
| pqr |
+-----+
```

## Standard input syntax:

```
graphgen
abc def
def ghi
ghi jkl
mno
pqr
```
output:
```
+-----+     +-----+     +-----+     +-----+
| abc | --> | def | --> | ghi | --> | jkl |
+-----+     +-----+     +-----+     +-----+
+-----+
| mno |
+-----+
+-----+
| pqr |
+-----+
```
