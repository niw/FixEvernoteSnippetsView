NAME = FixEvernoteSnippetsView

BUILD_PATH = build

XCODE_PROJECT_PATH = $(NAME).xcodeproj
XCODE_SCHEME = $(NAME)
XCODE_ARCHIVE_PATH = $(BUILD_PATH)/$(NAME).xcarchive

TARGET_PATH = $(XCODE_ARCHIVE_PATH)/Products/usr/local/lib/libFixEvernoteSnippetsView.dylib

.PHONY: all
all: $(TARGET_PATH)

.PHONY: claen
clean:
	git clean -dfX

$(TARGET_PATH):
	xcodebuild \
		-project "$(XCODE_PROJECT_PATH)" \
		-scheme "$(XCODE_SCHEME)" \
		-derivedDataPath "$(BUILD_PATH)" \
		-archivePath "$(XCODE_ARCHIVE_PATH)" \
		archive
