// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Chat.pb.h"

@implementation ChatRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [ChatRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

BOOL ContentTypeIsValidValue(ContentType value) {
  switch (value) {
    case ContentTypeContent:
    case ContentTypePhoto:
    case ContentTypeAudio:
    case ContentTypeFile:
    case ContentTypeVideo:
      return YES;
    default:
      return NO;
  }
}
BOOL StateTypeIsValidValue(StateType value) {
  switch (value) {
    case StateTypeOnLine:
    case StateTypeOutLine:
      return YES;
    default:
      return NO;
  }
}
BOOL ChatTypeIsValidValue(ChatType value) {
  switch (value) {
    case ChatTypeGroup:
    case ChatTypePoint:
      return YES;
    default:
      return NO;
  }
}
@interface CPrivateChat ()
@property (retain) NSString* self;
@property (retain) NSString* dest;
@property ContentType contentType;
@property (retain) NSString* contentTime;
@property (retain) NSString* content;
@property (retain) NSData* file;
@property (retain) NSString* initialFileName;
@property (retain) NSString* newFileName;
@property ChatType chatType;
@property (retain) NSString* groupId;
@end

@implementation CPrivateChat

- (BOOL) hasSelf {
  return !!hasSelf_;
}
- (void) setHasSelf:(BOOL) value {
  hasSelf_ = !!value;
}
@synthesize self;
- (BOOL) hasDest {
  return !!hasDest_;
}
- (void) setHasDest:(BOOL) value {
  hasDest_ = !!value;
}
@synthesize dest;
- (BOOL) hasContentType {
  return !!hasContentType_;
}
- (void) setHasContentType:(BOOL) value {
  hasContentType_ = !!value;
}
@synthesize contentType;
- (BOOL) hasContentTime {
  return !!hasContentTime_;
}
- (void) setHasContentTime:(BOOL) value {
  hasContentTime_ = !!value;
}
@synthesize contentTime;
- (BOOL) hasContent {
  return !!hasContent_;
}
- (void) setHasContent:(BOOL) value {
  hasContent_ = !!value;
}
@synthesize content;
- (BOOL) hasFile {
  return !!hasFile_;
}
- (void) setHasFile:(BOOL) value {
  hasFile_ = !!value;
}
@synthesize file;
- (BOOL) hasInitialFileName {
  return !!hasInitialFileName_;
}
- (void) setHasInitialFileName:(BOOL) value {
  hasInitialFileName_ = !!value;
}
@synthesize initialFileName;
- (BOOL) hasNewFileName {
  return !!hasNewFileName_;
}
- (void) setHasNewFileName:(BOOL) value {
  hasNewFileName_ = !!value;
}
@synthesize newFileName;
- (BOOL) hasChatType {
  return !!hasChatType_;
}
- (void) setHasChatType:(BOOL) value {
  hasChatType_ = !!value;
}
@synthesize chatType;
- (BOOL) hasGroupId {
  return !!hasGroupId_;
}
- (void) setHasGroupId:(BOOL) value {
  hasGroupId_ = !!value;
}
@synthesize groupId;
- (void) dealloc {
  self.self = nil;
  self.dest = nil;
  self.contentTime = nil;
  self.content = nil;
  self.file = nil;
  self.initialFileName = nil;
  self.newFileName = nil;
  self.groupId = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.self = @"";
    self.dest = @"";
    self.contentType = ContentTypeContent;
    self.contentTime = @"";
    self.content = @"";
    self.file = [NSData data];
    self.initialFileName = @"";
    self.newFileName = @"";
    self.chatType = ChatTypeGroup;
    self.groupId = @"";
  }
  return self;
}
static CPrivateChat* defaultCPrivateChatInstance = nil;
+ (void) initialize {
  if (self == [CPrivateChat class]) {
    defaultCPrivateChatInstance = [[CPrivateChat alloc] init];
  }
}
+ (CPrivateChat*) defaultInstance {
  return defaultCPrivateChatInstance;
}
- (CPrivateChat*) defaultInstance {
  return defaultCPrivateChatInstance;
}
- (BOOL) isInitialized {
  if (!self.hasSelf) {
    return NO;
  }
  if (!self.hasDest) {
    return NO;
  }
  if (!self.hasContentType) {
    return NO;
  }
  if (!self.hasContentTime) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasSelf) {
    [output writeString:1 value:self.self];
  }
  if (self.hasDest) {
    [output writeString:2 value:self.dest];
  }
  if (self.hasContentType) {
    [output writeEnum:3 value:self.contentType];
  }
  if (self.hasContentTime) {
    [output writeString:4 value:self.contentTime];
  }
  if (self.hasContent) {
    [output writeString:5 value:self.content];
  }
  if (self.hasFile) {
    [output writeData:6 value:self.file];
  }
  if (self.hasInitialFileName) {
    [output writeString:7 value:self.initialFileName];
  }
  if (self.hasNewFileName) {
    [output writeString:8 value:self.newFileName];
  }
  if (self.hasChatType) {
    [output writeEnum:9 value:self.chatType];
  }
  if (self.hasGroupId) {
    [output writeString:10 value:self.groupId];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasSelf) {
    size += computeStringSize(1, self.self);
  }
  if (self.hasDest) {
    size += computeStringSize(2, self.dest);
  }
  if (self.hasContentType) {
    size += computeEnumSize(3, self.contentType);
  }
  if (self.hasContentTime) {
    size += computeStringSize(4, self.contentTime);
  }
  if (self.hasContent) {
    size += computeStringSize(5, self.content);
  }
  if (self.hasFile) {
    size += computeDataSize(6, self.file);
  }
  if (self.hasInitialFileName) {
    size += computeStringSize(7, self.initialFileName);
  }
  if (self.hasNewFileName) {
    size += computeStringSize(8, self.newFileName);
  }
  if (self.hasChatType) {
    size += computeEnumSize(9, self.chatType);
  }
  if (self.hasGroupId) {
    size += computeStringSize(10, self.groupId);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (CPrivateChat*) parseFromData:(NSData*) data {
  return (CPrivateChat*)[[[CPrivateChat builder] mergeFromData:data] build];
}
+ (CPrivateChat*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CPrivateChat*)[[[CPrivateChat builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (CPrivateChat*) parseFromInputStream:(NSInputStream*) input {
  return (CPrivateChat*)[[[CPrivateChat builder] mergeFromInputStream:input] build];
}
+ (CPrivateChat*) parseDelimitedFromInputStream:(NSInputStream*) input {
  return (CPrivateChat*)[[[CPrivateChat builder] mergeDelimitedFromInputStream:input] build];
}
+ (CPrivateChat*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CPrivateChat*)[[[CPrivateChat builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (CPrivateChat*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (CPrivateChat*)[[[CPrivateChat builder] mergeFromCodedInputStream:input] build];
}
+ (CPrivateChat*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CPrivateChat*)[[[CPrivateChat builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (CPrivateChat_Builder*) builder {
  return [[[CPrivateChat_Builder alloc] init] autorelease];
}
+ (CPrivateChat_Builder*) builderWithPrototype:(CPrivateChat*) prototype {
  return [[CPrivateChat builder] mergeFrom:prototype];
}
- (CPrivateChat_Builder*) builder {
  return [CPrivateChat builder];
}
@end

@interface CPrivateChat_Builder()
@property (retain) CPrivateChat* result;
@end

@implementation CPrivateChat_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[CPrivateChat alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (CPrivateChat_Builder*) clear {
  self.result = [[[CPrivateChat alloc] init] autorelease];
  return self;
}
- (CPrivateChat_Builder*) clone {
  return [CPrivateChat builderWithPrototype:result];
}
- (CPrivateChat*) defaultInstance {
  return [CPrivateChat defaultInstance];
}
- (CPrivateChat*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (CPrivateChat*) buildPartial {
  CPrivateChat* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (CPrivateChat_Builder*) mergeFrom:(CPrivateChat*) other {
  if (other == [CPrivateChat defaultInstance]) {
    return self;
  }
  if (other.hasSelf) {
    [self setSelf:other.self];
  }
  if (other.hasDest) {
    [self setDest:other.dest];
  }
  if (other.hasContentType) {
    [self setContentType:other.contentType];
  }
  if (other.hasContentTime) {
    [self setContentTime:other.contentTime];
  }
  if (other.hasContent) {
    [self setContent:other.content];
  }
  if (other.hasFile) {
    [self setFile:other.file];
  }
  if (other.hasInitialFileName) {
    [self setInitialFileName:other.initialFileName];
  }
  if (other.hasNewFileName) {
    [self setNewFileName:other.newFileName];
  }
  if (other.hasChatType) {
    [self setChatType:other.chatType];
  }
  if (other.hasGroupId) {
    [self setGroupId:other.groupId];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (CPrivateChat_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (CPrivateChat_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        [self setSelf:[input readString]];
        break;
      }
      case 18: {
        [self setDest:[input readString]];
        break;
      }
      case 24: {
        int32_t value = [input readEnum];
        if (ContentTypeIsValidValue(value)) {
          [self setContentType:value];
        } else {
          [unknownFields mergeVarintField:3 value:value];
        }
        break;
      }
      case 34: {
        [self setContentTime:[input readString]];
        break;
      }
      case 42: {
        [self setContent:[input readString]];
        break;
      }
      case 50: {
        [self setFile:[input readData]];
        break;
      }
      case 58: {
        [self setInitialFileName:[input readString]];
        break;
      }
      case 66: {
        [self setNewFileName:[input readString]];
        break;
      }
      case 72: {
        int32_t value = [input readEnum];
        if (ChatTypeIsValidValue(value)) {
          [self setChatType:value];
        } else {
          [unknownFields mergeVarintField:9 value:value];
        }
        break;
      }
      case 82: {
        [self setGroupId:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasSelf {
  return result.hasSelf;
}
- (NSString*) self {
  return result.self;
}
- (CPrivateChat_Builder*) setSelf:(NSString*) value {
  result.hasSelf = YES;
  result.self = value;
  return self;
}
- (CPrivateChat_Builder*) clearSelf {
  result.hasSelf = NO;
  result.self = @"";
  return self;
}
- (BOOL) hasDest {
  return result.hasDest;
}
- (NSString*) dest {
  return result.dest;
}
- (CPrivateChat_Builder*) setDest:(NSString*) value {
  result.hasDest = YES;
  result.dest = value;
  return self;
}
- (CPrivateChat_Builder*) clearDest {
  result.hasDest = NO;
  result.dest = @"";
  return self;
}
- (BOOL) hasContentType {
  return result.hasContentType;
}
- (ContentType) contentType {
  return result.contentType;
}
- (CPrivateChat_Builder*) setContentType:(ContentType) value {
  result.hasContentType = YES;
  result.contentType = value;
  return self;
}
- (CPrivateChat_Builder*) clearContentType {
  result.hasContentType = NO;
  result.contentType = ContentTypeContent;
  return self;
}
- (BOOL) hasContentTime {
  return result.hasContentTime;
}
- (NSString*) contentTime {
  return result.contentTime;
}
- (CPrivateChat_Builder*) setContentTime:(NSString*) value {
  result.hasContentTime = YES;
  result.contentTime = value;
  return self;
}
- (CPrivateChat_Builder*) clearContentTime {
  result.hasContentTime = NO;
  result.contentTime = @"";
  return self;
}
- (BOOL) hasContent {
  return result.hasContent;
}
- (NSString*) content {
  return result.content;
}
- (CPrivateChat_Builder*) setContent:(NSString*) value {
  result.hasContent = YES;
  result.content = value;
  return self;
}
- (CPrivateChat_Builder*) clearContent {
  result.hasContent = NO;
  result.content = @"";
  return self;
}
- (BOOL) hasFile {
  return result.hasFile;
}
- (NSData*) file {
  return result.file;
}
- (CPrivateChat_Builder*) setFile:(NSData*) value {
  result.hasFile = YES;
  result.file = value;
  return self;
}
- (CPrivateChat_Builder*) clearFile {
  result.hasFile = NO;
  result.file = [NSData data];
  return self;
}
- (BOOL) hasInitialFileName {
  return result.hasInitialFileName;
}
- (NSString*) initialFileName {
  return result.initialFileName;
}
- (CPrivateChat_Builder*) setInitialFileName:(NSString*) value {
  result.hasInitialFileName = YES;
  result.initialFileName = value;
  return self;
}
- (CPrivateChat_Builder*) clearInitialFileName {
  result.hasInitialFileName = NO;
  result.initialFileName = @"";
  return self;
}
- (BOOL) hasNewFileName {
  return result.hasNewFileName;
}
- (NSString*) newFileName {
  return result.newFileName;
}
- (CPrivateChat_Builder*) setNewFileName:(NSString*) value {
  result.hasNewFileName = YES;
  result.newFileName = value;
  return self;
}
- (CPrivateChat_Builder*) clearNewFileName {
  result.hasNewFileName = NO;
  result.newFileName = @"";
  return self;
}
- (BOOL) hasChatType {
  return result.hasChatType;
}
- (ChatType) chatType {
  return result.chatType;
}
- (CPrivateChat_Builder*) setChatType:(ChatType) value {
  result.hasChatType = YES;
  result.chatType = value;
  return self;
}
- (CPrivateChat_Builder*) clearChatType {
  result.hasChatType = NO;
  result.chatType = ChatTypeGroup;
  return self;
}
- (BOOL) hasGroupId {
  return result.hasGroupId;
}
- (NSString*) groupId {
  return result.groupId;
}
- (CPrivateChat_Builder*) setGroupId:(NSString*) value {
  result.hasGroupId = YES;
  result.groupId = value;
  return self;
}
- (CPrivateChat_Builder*) clearGroupId {
  result.hasGroupId = NO;
  result.groupId = @"";
  return self;
}
@end

@interface CFileChat ()
@property (retain) NSData* file;
@property (retain) NSString* initialFileName;
@property (retain) NSString* newFileName;
@end

@implementation CFileChat

- (BOOL) hasFile {
  return !!hasFile_;
}
- (void) setHasFile:(BOOL) value {
  hasFile_ = !!value;
}
@synthesize file;
- (BOOL) hasInitialFileName {
  return !!hasInitialFileName_;
}
- (void) setHasInitialFileName:(BOOL) value {
  hasInitialFileName_ = !!value;
}
@synthesize initialFileName;
- (BOOL) hasNewFileName {
  return !!hasNewFileName_;
}
- (void) setHasNewFileName:(BOOL) value {
  hasNewFileName_ = !!value;
}
@synthesize newFileName;
- (void) dealloc {
  self.file = nil;
  self.initialFileName = nil;
  self.newFileName = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.file = [NSData data];
    self.initialFileName = @"";
    self.newFileName = @"";
  }
  return self;
}
static CFileChat* defaultCFileChatInstance = nil;
+ (void) initialize {
  if (self == [CFileChat class]) {
    defaultCFileChatInstance = [[CFileChat alloc] init];
  }
}
+ (CFileChat*) defaultInstance {
  return defaultCFileChatInstance;
}
- (CFileChat*) defaultInstance {
  return defaultCFileChatInstance;
}
- (BOOL) isInitialized {
  if (!self.hasInitialFileName) {
    return NO;
  }
  if (!self.hasNewFileName) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasFile) {
    [output writeData:1 value:self.file];
  }
  if (self.hasInitialFileName) {
    [output writeString:2 value:self.initialFileName];
  }
  if (self.hasNewFileName) {
    [output writeString:3 value:self.newFileName];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasFile) {
    size += computeDataSize(1, self.file);
  }
  if (self.hasInitialFileName) {
    size += computeStringSize(2, self.initialFileName);
  }
  if (self.hasNewFileName) {
    size += computeStringSize(3, self.newFileName);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (CFileChat*) parseFromData:(NSData*) data {
  return (CFileChat*)[[[CFileChat builder] mergeFromData:data] build];
}
+ (CFileChat*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CFileChat*)[[[CFileChat builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (CFileChat*) parseFromInputStream:(NSInputStream*) input {
  return (CFileChat*)[[[CFileChat builder] mergeFromInputStream:input] build];
}
+ (CFileChat*) parseDelimitedFromInputStream:(NSInputStream*) input {
  return (CFileChat*)[[[CFileChat builder] mergeDelimitedFromInputStream:input] build];
}
+ (CFileChat*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CFileChat*)[[[CFileChat builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (CFileChat*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (CFileChat*)[[[CFileChat builder] mergeFromCodedInputStream:input] build];
}
+ (CFileChat*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CFileChat*)[[[CFileChat builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (CFileChat_Builder*) builder {
  return [[[CFileChat_Builder alloc] init] autorelease];
}
+ (CFileChat_Builder*) builderWithPrototype:(CFileChat*) prototype {
  return [[CFileChat builder] mergeFrom:prototype];
}
- (CFileChat_Builder*) builder {
  return [CFileChat builder];
}
@end

@interface CFileChat_Builder()
@property (retain) CFileChat* result;
@end

@implementation CFileChat_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[CFileChat alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (CFileChat_Builder*) clear {
  self.result = [[[CFileChat alloc] init] autorelease];
  return self;
}
- (CFileChat_Builder*) clone {
  return [CFileChat builderWithPrototype:result];
}
- (CFileChat*) defaultInstance {
  return [CFileChat defaultInstance];
}
- (CFileChat*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (CFileChat*) buildPartial {
  CFileChat* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (CFileChat_Builder*) mergeFrom:(CFileChat*) other {
  if (other == [CFileChat defaultInstance]) {
    return self;
  }
  if (other.hasFile) {
    [self setFile:other.file];
  }
  if (other.hasInitialFileName) {
    [self setInitialFileName:other.initialFileName];
  }
  if (other.hasNewFileName) {
    [self setNewFileName:other.newFileName];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (CFileChat_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (CFileChat_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        [self setFile:[input readData]];
        break;
      }
      case 18: {
        [self setInitialFileName:[input readString]];
        break;
      }
      case 26: {
        [self setNewFileName:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasFile {
  return result.hasFile;
}
- (NSData*) file {
  return result.file;
}
- (CFileChat_Builder*) setFile:(NSData*) value {
  result.hasFile = YES;
  result.file = value;
  return self;
}
- (CFileChat_Builder*) clearFile {
  result.hasFile = NO;
  result.file = [NSData data];
  return self;
}
- (BOOL) hasInitialFileName {
  return result.hasInitialFileName;
}
- (NSString*) initialFileName {
  return result.initialFileName;
}
- (CFileChat_Builder*) setInitialFileName:(NSString*) value {
  result.hasInitialFileName = YES;
  result.initialFileName = value;
  return self;
}
- (CFileChat_Builder*) clearInitialFileName {
  result.hasInitialFileName = NO;
  result.initialFileName = @"";
  return self;
}
- (BOOL) hasNewFileName {
  return result.hasNewFileName;
}
- (NSString*) newFileName {
  return result.newFileName;
}
- (CFileChat_Builder*) setNewFileName:(NSString*) value {
  result.hasNewFileName = YES;
  result.newFileName = value;
  return self;
}
- (CFileChat_Builder*) clearNewFileName {
  result.hasNewFileName = NO;
  result.newFileName = @"";
  return self;
}
@end

@interface CListChat ()
@property (retain) NSMutableArray* mutableChatsList;
@end

@implementation CListChat

@synthesize mutableChatsList;
- (void) dealloc {
  self.mutableChatsList = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
  }
  return self;
}
static CListChat* defaultCListChatInstance = nil;
+ (void) initialize {
  if (self == [CListChat class]) {
    defaultCListChatInstance = [[CListChat alloc] init];
  }
}
+ (CListChat*) defaultInstance {
  return defaultCListChatInstance;
}
- (CListChat*) defaultInstance {
  return defaultCListChatInstance;
}
- (NSArray*) chatsList {
  return mutableChatsList;
}
- (CPrivateChat*) chatsAtIndex:(int32_t) index {
  id value = [mutableChatsList objectAtIndex:index];
  return value;
}
- (BOOL) isInitialized {
  for (CPrivateChat* element in self.chatsList) {
    if (!element.isInitialized) {
      return NO;
    }
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  for (CPrivateChat* element in self.chatsList) {
    [output writeMessage:1 value:element];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  for (CPrivateChat* element in self.chatsList) {
    size += computeMessageSize(1, element);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (CListChat*) parseFromData:(NSData*) data {
  return (CListChat*)[[[CListChat builder] mergeFromData:data] build];
}
+ (CListChat*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CListChat*)[[[CListChat builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (CListChat*) parseFromInputStream:(NSInputStream*) input {
  return (CListChat*)[[[CListChat builder] mergeFromInputStream:input] build];
}
+ (CListChat*) parseDelimitedFromInputStream:(NSInputStream*) input {
  return (CListChat*)[[[CListChat builder] mergeDelimitedFromInputStream:input] build];
}
+ (CListChat*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CListChat*)[[[CListChat builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (CListChat*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (CListChat*)[[[CListChat builder] mergeFromCodedInputStream:input] build];
}
+ (CListChat*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CListChat*)[[[CListChat builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (CListChat_Builder*) builder {
  return [[[CListChat_Builder alloc] init] autorelease];
}
+ (CListChat_Builder*) builderWithPrototype:(CListChat*) prototype {
  return [[CListChat builder] mergeFrom:prototype];
}
- (CListChat_Builder*) builder {
  return [CListChat builder];
}
@end

@interface CListChat_Builder()
@property (retain) CListChat* result;
@end

@implementation CListChat_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[CListChat alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (CListChat_Builder*) clear {
  self.result = [[[CListChat alloc] init] autorelease];
  return self;
}
- (CListChat_Builder*) clone {
  return [CListChat builderWithPrototype:result];
}
- (CListChat*) defaultInstance {
  return [CListChat defaultInstance];
}
- (CListChat*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (CListChat*) buildPartial {
  CListChat* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (CListChat_Builder*) mergeFrom:(CListChat*) other {
  if (other == [CListChat defaultInstance]) {
    return self;
  }
  if (other.mutableChatsList.count > 0) {
    if (result.mutableChatsList == nil) {
      result.mutableChatsList = [NSMutableArray array];
    }
    [result.mutableChatsList addObjectsFromArray:other.mutableChatsList];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (CListChat_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (CListChat_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 10: {
        CPrivateChat_Builder* subBuilder = [CPrivateChat builder];
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self addChats:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (NSArray*) chatsList {
  if (result.mutableChatsList == nil) { return [NSArray array]; }
  return result.mutableChatsList;
}
- (CPrivateChat*) chatsAtIndex:(int32_t) index {
  return [result chatsAtIndex:index];
}
- (CListChat_Builder*) replaceChatsAtIndex:(int32_t) index with:(CPrivateChat*) value {
  [result.mutableChatsList replaceObjectAtIndex:index withObject:value];
  return self;
}
- (CListChat_Builder*) addAllChats:(NSArray*) values {
  if (result.mutableChatsList == nil) {
    result.mutableChatsList = [NSMutableArray array];
  }
  [result.mutableChatsList addObjectsFromArray:values];
  return self;
}
- (CListChat_Builder*) clearChatsList {
  result.mutableChatsList = nil;
  return self;
}
- (CListChat_Builder*) addChats:(CPrivateChat*) value {
  if (result.mutableChatsList == nil) {
    result.mutableChatsList = [NSMutableArray array];
  }
  [result.mutableChatsList addObject:value];
  return self;
}
@end

@interface CLineChat ()
@property StateType lineState;
@property (retain) NSString* userId;
@end

@implementation CLineChat

- (BOOL) hasLineState {
  return !!hasLineState_;
}
- (void) setHasLineState:(BOOL) value {
  hasLineState_ = !!value;
}
@synthesize lineState;
- (BOOL) hasUserId {
  return !!hasUserId_;
}
- (void) setHasUserId:(BOOL) value {
  hasUserId_ = !!value;
}
@synthesize userId;
- (void) dealloc {
  self.userId = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.lineState = StateTypeOnLine;
    self.userId = @"";
  }
  return self;
}
static CLineChat* defaultCLineChatInstance = nil;
+ (void) initialize {
  if (self == [CLineChat class]) {
    defaultCLineChatInstance = [[CLineChat alloc] init];
  }
}
+ (CLineChat*) defaultInstance {
  return defaultCLineChatInstance;
}
- (CLineChat*) defaultInstance {
  return defaultCLineChatInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasLineState) {
    [output writeEnum:1 value:self.lineState];
  }
  if (self.hasUserId) {
    [output writeString:2 value:self.userId];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasLineState) {
    size += computeEnumSize(1, self.lineState);
  }
  if (self.hasUserId) {
    size += computeStringSize(2, self.userId);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (CLineChat*) parseFromData:(NSData*) data {
  return (CLineChat*)[[[CLineChat builder] mergeFromData:data] build];
}
+ (CLineChat*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CLineChat*)[[[CLineChat builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (CLineChat*) parseFromInputStream:(NSInputStream*) input {
  return (CLineChat*)[[[CLineChat builder] mergeFromInputStream:input] build];
}
+ (CLineChat*) parseDelimitedFromInputStream:(NSInputStream*) input {
  return (CLineChat*)[[[CLineChat builder] mergeDelimitedFromInputStream:input] build];
}
+ (CLineChat*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CLineChat*)[[[CLineChat builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (CLineChat*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (CLineChat*)[[[CLineChat builder] mergeFromCodedInputStream:input] build];
}
+ (CLineChat*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CLineChat*)[[[CLineChat builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (CLineChat_Builder*) builder {
  return [[[CLineChat_Builder alloc] init] autorelease];
}
+ (CLineChat_Builder*) builderWithPrototype:(CLineChat*) prototype {
  return [[CLineChat builder] mergeFrom:prototype];
}
- (CLineChat_Builder*) builder {
  return [CLineChat builder];
}
@end

@interface CLineChat_Builder()
@property (retain) CLineChat* result;
@end

@implementation CLineChat_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[CLineChat alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (CLineChat_Builder*) clear {
  self.result = [[[CLineChat alloc] init] autorelease];
  return self;
}
- (CLineChat_Builder*) clone {
  return [CLineChat builderWithPrototype:result];
}
- (CLineChat*) defaultInstance {
  return [CLineChat defaultInstance];
}
- (CLineChat*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (CLineChat*) buildPartial {
  CLineChat* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (CLineChat_Builder*) mergeFrom:(CLineChat*) other {
  if (other == [CLineChat defaultInstance]) {
    return self;
  }
  if (other.hasLineState) {
    [self setLineState:other.lineState];
  }
  if (other.hasUserId) {
    [self setUserId:other.userId];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (CLineChat_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (CLineChat_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 8: {
        int32_t value = [input readEnum];
        if (StateTypeIsValidValue(value)) {
          [self setLineState:value];
        } else {
          [unknownFields mergeVarintField:1 value:value];
        }
        break;
      }
      case 18: {
        [self setUserId:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasLineState {
  return result.hasLineState;
}
- (StateType) lineState {
  return result.lineState;
}
- (CLineChat_Builder*) setLineState:(StateType) value {
  result.hasLineState = YES;
  result.lineState = value;
  return self;
}
- (CLineChat_Builder*) clearLineState {
  result.hasLineState = NO;
  result.lineState = StateTypeOnLine;
  return self;
}
- (BOOL) hasUserId {
  return result.hasUserId;
}
- (NSString*) userId {
  return result.userId;
}
- (CLineChat_Builder*) setUserId:(NSString*) value {
  result.hasUserId = YES;
  result.userId = value;
  return self;
}
- (CLineChat_Builder*) clearUserId {
  result.hasUserId = NO;
  result.userId = @"";
  return self;
}
@end

