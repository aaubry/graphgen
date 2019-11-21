
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

## Showing task dependencies in a Cake script

Add the following to your cake script:

```c#
#tool "nuget:?package=Tools.Graphgen&version=1.0.0"

Task("Dependencies")
	.Description("Shows task dependencies")
    .Does(() =>
    {
		Console.ForegroundColor = ConsoleColor.Blue;
		Console.WriteLine("\n» Task dependencies\n");
		Console.ForegroundColor = ConsoleColor.Gray;
		var tasks = Tasks.Select(t => t.Name);
		var dependencies = Tasks.SelectMany(t => t.Dependencies.Select(d => $"{t.Name} {d.Name}"));
		var graphgenExe = Context.Tools.Resolve(IsRunningOnWindows() ? "graphgen.exe" : "graphgen");
		StartProcess(graphgenExe, string.Join(" . ", tasks.Concat(dependencies)));
    });
```
