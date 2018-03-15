NAME = FixEvernoteSnippetsView
PRODUCT_NAME = libFixEvernoteSnippetsView.dylib

BUILD_PATH = build

XCODE_PROJECT_PATH = $(NAME).xcodeproj
XCODE_SCHEME = $(NAME)
XCODE_ARCHIVE_PATH = $(BUILD_PATH)/$(NAME).xcarchive
XCODE_ARCHIVE_PRODUCT_PATH = $(XCODE_ARCHIVE_PATH)/Products/usr/local/lib/$(PRODUCT_NAME)

OPEN_PATH = $(BUILD_PATH)/open

.PHONY: all
all: evernote

.PHONY: claen
clean:
	git clean -dfX

$(XCODE_ARCHIVE_PRODUCT_PATH):
	xcodebuild \
		-project "$(XCODE_PROJECT_PATH)" \
		-scheme "$(XCODE_SCHEME)" \
		-derivedDataPath "$(BUILD_PATH)" \
		-archivePath "$(XCODE_ARCHIVE_PATH)" \
		archive

$(OPEN_PATH): open.m
	$(CC) -fmodules -fobjc-arc -o $@ $<

.PHONY: evernote
evernote: $(XCODE_ARCHIVE_PRODUCT_PATH) $(OPEN_PATH)
	env -i DYLD_INSERT_LIBRARIES=$(PWD)/$(XCODE_ARCHIVE_PRODUCT_PATH) $(OPEN_PATH) /Applications/Evernote.app
