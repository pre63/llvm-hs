default: all

all: install-deps build

# Install dependencies
install-deps:
	cabal clean --project-file=cabal.project
	cabal update
	cabal install --dependencies-only all --project-file=cabal.project --extra-include-dirs=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include:/opt/homebrew/opt/llvm@12/include --extra-lib-dirs=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib:/opt/homebrew/opt/llvm@12/lib -v3


# Build the project
build:
	cabal build all --project-file=cabal.project --extra-include-dirs=$(C_INCLUDE_PATH) --extra-lib-dirs=$(LIBRARY_PATH)  -v3

# Clean the project
clean:
	cabal clean --project-file=cabal.project
	rm -rf dist-newstyle

# Debug build with verbose output
debug:
	cabal build all --project-file=cabal.project --extra-include-dirs=$(C_INCLUDE_PATH) --extra-lib-dirs=$(LIBRARY_PATH) -v3
