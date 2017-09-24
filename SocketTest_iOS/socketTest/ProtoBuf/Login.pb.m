// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "Login.pb.h"

@implementation LoginRoot
static PBExtensionRegistry* extensionRegistry = nil;
+ (PBExtensionRegistry*) extensionRegistry {
  return extensionRegistry;
}

+ (void) initialize {
  if (self == [LoginRoot class]) {
    PBMutableExtensionRegistry* registry = [PBMutableExtensionRegistry registry];
    [self registerAllExtensions:registry];
    extensionRegistry = [registry retain];
  }
}
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry {
}
@end

BOOL TypeIsValidValue(Type value) {
  switch (value) {
    case TypeWindows:
    case TypeAndroid:
      return YES;
    default:
      return NO;
  }
}
@interface CLogin ()
@property (retain) NSString* userid;
@property Type type;
@property (retain) NSString* passwd;
@end

@implementation CLogin

- (BOOL) hasUserid {
  return !!hasUserid_;
}
- (void) setHasUserid:(BOOL) value {
  hasUserid_ = !!value;
}
@synthesize userid;
- (BOOL) hasType {
  return !!hasType_;
}
- (void) setHasType:(BOOL) value {
  hasType_ = !!value;
}
@synthesize type;
- (BOOL) hasPasswd {
  return !!hasPasswd_;
}
- (void) setHasPasswd:(BOOL) value {
  hasPasswd_ = !!value;
}
@synthesize passwd;
- (void) dealloc {
  self.userid = nil;
  self.passwd = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.userid = @"";
    self.type = TypeWindows;
    self.passwd = @"";
  }
  return self;
}
static CLogin* defaultCLoginInstance = nil;
+ (void) initialize {
  if (self == [CLogin class]) {
    defaultCLoginInstance = [[CLogin alloc] init];
  }
}
+ (CLogin*) defaultInstance {
  return defaultCLoginInstance;
}
- (CLogin*) defaultInstance {
  return defaultCLoginInstance;
}
- (BOOL) isInitialized {
  if (!self.hasUserid) {
    return NO;
  }
  if (!self.hasType) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasUserid) {
    [output writeString:1 value:self.userid];
  }
  if (self.hasType) {
    [output writeEnum:2 value:self.type];
  }
  if (self.hasPasswd) {
    [output writeString:3 value:self.passwd];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasUserid) {
    size += computeStringSize(1, self.userid);
  }
  if (self.hasType) {
    size += computeEnumSize(2, self.type);
  }
  if (self.hasPasswd) {
    size += computeStringSize(3, self.passwd);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (CLogin*) parseFromData:(NSData*) data {
  return (CLogin*)[[[CLogin builder] mergeFromData:data] build];
}
+ (CLogin*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CLogin*)[[[CLogin builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (CLogin*) parseFromInputStream:(NSInputStream*) input {
  return (CLogin*)[[[CLogin builder] mergeFromInputStream:input] build];
}
+ (CLogin*) parseDelimitedFromInputStream:(NSInputStream*) input {
  return (CLogin*)[[[CLogin builder] mergeDelimitedFromInputStream:input] build];
}
+ (CLogin*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CLogin*)[[[CLogin builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (CLogin*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (CLogin*)[[[CLogin builder] mergeFromCodedInputStream:input] build];
}
+ (CLogin*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (CLogin*)[[[CLogin builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (CLogin_Builder*) builder {
  return [[[CLogin_Builder alloc] init] autorelease];
}
+ (CLogin_Builder*) builderWithPrototype:(CLogin*) prototype {
  return [[CLogin builder] mergeFrom:prototype];
}
- (CLogin_Builder*) builder {
  return [CLogin builder];
}
@end

@interface CLogin_Builder()
@property (retain) CLogin* result;
@end

@implementation CLogin_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[CLogin alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (CLogin_Builder*) clear {
  self.result = [[[CLogin alloc] init] autorelease];
  return self;
}
- (CLogin_Builder*) clone {
  return [CLogin builderWithPrototype:result];
}
- (CLogin*) defaultInstance {
  return [CLogin defaultInstance];
}
- (CLogin*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (CLogin*) buildPartial {
  CLogin* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (CLogin_Builder*) mergeFrom:(CLogin*) other {
  if (other == [CLogin defaultInstance]) {
    return self;
  }
  if (other.hasUserid) {
    [self setUserid:other.userid];
  }
  if (other.hasType) {
    [self setType:other.type];
  }
  if (other.hasPasswd) {
    [self setPasswd:other.passwd];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (CLogin_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (CLogin_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setUserid:[input readString]];
        break;
      }
      case 16: {
        int32_t value = [input readEnum];
        if (TypeIsValidValue(value)) {
          [self setType:value];
        } else {
          [unknownFields mergeVarintField:2 value:value];
        }
        break;
      }
      case 26: {
        [self setPasswd:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasUserid {
  return result.hasUserid;
}
- (NSString*) userid {
  return result.userid;
}
- (CLogin_Builder*) setUserid:(NSString*) value {
  result.hasUserid = YES;
  result.userid = value;
  return self;
}
- (CLogin_Builder*) clearUserid {
  result.hasUserid = NO;
  result.userid = @"";
  return self;
}
- (BOOL) hasType {
  return result.hasType;
}
- (Type) type {
  return result.type;
}
- (CLogin_Builder*) setType:(Type) value {
  result.hasType = YES;
  result.type = value;
  return self;
}
- (CLogin_Builder*) clearType {
  result.hasType = NO;
  result.type = TypeWindows;
  return self;
}
- (BOOL) hasPasswd {
  return result.hasPasswd;
}
- (NSString*) passwd {
  return result.passwd;
}
- (CLogin_Builder*) setPasswd:(NSString*) value {
  result.hasPasswd = YES;
  result.passwd = value;
  return self;
}
- (CLogin_Builder*) clearPasswd {
  result.hasPasswd = NO;
  result.passwd = @"";
  return self;
}
@end

@interface SResponse ()
@property int32_t code;
@property (retain) NSMutableArray* mutableOnLineUsersList;
@property (retain) NSString* desc;
@end

@implementation SResponse

- (BOOL) hasCode {
  return !!hasCode_;
}
- (void) setHasCode:(BOOL) value {
  hasCode_ = !!value;
}
@synthesize code;
@synthesize mutableOnLineUsersList;
- (BOOL) hasDesc {
  return !!hasDesc_;
}
- (void) setHasDesc:(BOOL) value {
  hasDesc_ = !!value;
}
@synthesize desc;
- (void) dealloc {
  self.mutableOnLineUsersList = nil;
  self.desc = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.code = 0;
    self.desc = @"";
  }
  return self;
}
static SResponse* defaultSResponseInstance = nil;
+ (void) initialize {
  if (self == [SResponse class]) {
    defaultSResponseInstance = [[SResponse alloc] init];
  }
}
+ (SResponse*) defaultInstance {
  return defaultSResponseInstance;
}
- (SResponse*) defaultInstance {
  return defaultSResponseInstance;
}
- (NSArray*) onLineUsersList {
  return mutableOnLineUsersList;
}
- (NSString*) onLineUsersAtIndex:(int32_t) index {
  id value = [mutableOnLineUsersList objectAtIndex:index];
  return value;
}
- (BOOL) isInitialized {
  if (!self.hasCode) {
    return NO;
  }
  if (!self.hasDesc) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (self.hasCode) {
    [output writeInt32:1 value:self.code];
  }
  for (NSString* element in self.mutableOnLineUsersList) {
    [output writeString:2 value:element];
  }
  if (self.hasDesc) {
    [output writeString:3 value:self.desc];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (self.hasCode) {
    size += computeInt32Size(1, self.code);
  }
  {
    int32_t dataSize = 0;
    for (NSString* element in self.mutableOnLineUsersList) {
      dataSize += computeStringSizeNoTag(element);
    }
    size += dataSize;
    size += 1 * self.mutableOnLineUsersList.count;
  }
  if (self.hasDesc) {
    size += computeStringSize(3, self.desc);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (SResponse*) parseFromData:(NSData*) data {
  return (SResponse*)[[[SResponse builder] mergeFromData:data] build];
}
+ (SResponse*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (SResponse*)[[[SResponse builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (SResponse*) parseFromInputStream:(NSInputStream*) input {
  return (SResponse*)[[[SResponse builder] mergeFromInputStream:input] build];
}
+ (SResponse*) parseDelimitedFromInputStream:(NSInputStream*) input {
  return (SResponse*)[[[SResponse builder] mergeDelimitedFromInputStream:input] build];
}
+ (SResponse*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (SResponse*)[[[SResponse builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (SResponse*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (SResponse*)[[[SResponse builder] mergeFromCodedInputStream:input] build];
}
+ (SResponse*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (SResponse*)[[[SResponse builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (SResponse_Builder*) builder {
  return [[[SResponse_Builder alloc] init] autorelease];
}
+ (SResponse_Builder*) builderWithPrototype:(SResponse*) prototype {
  return [[SResponse builder] mergeFrom:prototype];
}
- (SResponse_Builder*) builder {
  return [SResponse builder];
}
@end

@interface SResponse_Builder()
@property (retain) SResponse* result;
@end

@implementation SResponse_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if ((self = [super init])) {
    self.result = [[[SResponse alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (SResponse_Builder*) clear {
  self.result = [[[SResponse alloc] init] autorelease];
  return self;
}
- (SResponse_Builder*) clone {
  return [SResponse builderWithPrototype:result];
}
- (SResponse*) defaultInstance {
  return [SResponse defaultInstance];
}
- (SResponse*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (SResponse*) buildPartial {
  SResponse* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (SResponse_Builder*) mergeFrom:(SResponse*) other {
  if (other == [SResponse defaultInstance]) {
    return self;
  }
  if (other.hasCode) {
    [self setCode:other.code];
  }
  if (other.mutableOnLineUsersList.count > 0) {
    if (result.mutableOnLineUsersList == nil) {
      result.mutableOnLineUsersList = [NSMutableArray array];
    }
    [result.mutableOnLineUsersList addObjectsFromArray:other.mutableOnLineUsersList];
  }
  if (other.hasDesc) {
    [self setDesc:other.desc];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (SResponse_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (SResponse_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setCode:[input readInt32]];
        break;
      }
      case 18: {
        [self addOnLineUsers:[input readString]];
        break;
      }
      case 26: {
        [self setDesc:[input readString]];
        break;
      }
    }
  }
}
- (BOOL) hasCode {
  return result.hasCode;
}
- (int32_t) code {
  return result.code;
}
- (SResponse_Builder*) setCode:(int32_t) value {
  result.hasCode = YES;
  result.code = value;
  return self;
}
- (SResponse_Builder*) clearCode {
  result.hasCode = NO;
  result.code = 0;
  return self;
}
- (NSArray*) onLineUsersList {
  if (result.mutableOnLineUsersList == nil) {
    return [NSArray array];
  }
  return result.mutableOnLineUsersList;
}
- (NSString*) onLineUsersAtIndex:(int32_t) index {
  return [result onLineUsersAtIndex:index];
}
- (SResponse_Builder*) replaceOnLineUsersAtIndex:(int32_t) index with:(NSString*) value {
  [result.mutableOnLineUsersList replaceObjectAtIndex:index withObject:value];
  return self;
}
- (SResponse_Builder*) addOnLineUsers:(NSString*) value {
  if (result.mutableOnLineUsersList == nil) {
    result.mutableOnLineUsersList = [NSMutableArray array];
  }
  [result.mutableOnLineUsersList addObject:value];
  return self;
}
- (SResponse_Builder*) addAllOnLineUsers:(NSArray*) values {
  if (result.mutableOnLineUsersList == nil) {
    result.mutableOnLineUsersList = [NSMutableArray array];
  }
  [result.mutableOnLineUsersList addObjectsFromArray:values];
  return self;
}
- (SResponse_Builder*) clearOnLineUsersList {
  result.mutableOnLineUsersList = nil;
  return self;
}
- (BOOL) hasDesc {
  return result.hasDesc;
}
- (NSString*) desc {
  return result.desc;
}
- (SResponse_Builder*) setDesc:(NSString*) value {
  result.hasDesc = YES;
  result.desc = value;
  return self;
}
- (SResponse_Builder*) clearDesc {
  result.hasDesc = NO;
  result.desc = @"";
  return self;
}
@end

