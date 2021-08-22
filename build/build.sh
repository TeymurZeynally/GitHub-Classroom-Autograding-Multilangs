#!/usr/bin/env bash
shopt -s nullglob

echo "[x]> Building dotnet"
for file in ./src/dotnet/*/Program.csproj
do
	directory=${file%/*}
	echo "Building $file"
	echo "Publishing to $directory/publish"
	dotnet publish "$file" --output "$directory/publish" --configuration Release || exit 1
	echo
done

echo "[x]> Building cpp"
for file in ./src/cpp/*/Program.cpp
do
	directory=${file%/*}
	echo "Building $file"
	echo "Compiling to $directory/publish"
	mkdir -p "$directory/publish" || exit 1
	rm -rf "$directory/publish/*" || exit 1
	g++ "$file" -o "$directory/publish/Program" || exit 1
done


echo "[x]> Building python"
for file in ./src/python/*/Program.py
do
	directory=${file%/*}
	echo "Creating shell for $file"
	mkdir -p "$directory/publish" || exit 1
	rm -rf "$directory/publish/*" || exit 1
	echo "
		#!/usr/bin/env bash
		python $file \$@" > "$directory/publish/Program" || exit 1
	chmod +x "$directory/publish/Program" || exit 1
done
