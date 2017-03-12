{.deadCodeElim: on.}

when defined(windows): 
  const 
    libname* = "freetype6.dll"
elif defined(macosx): 
  const 
    libname* = "libfreetype.6.dylib"
else: 
  const 
    libname* = "libfreetype.so"
    
type 
  Bytes* = ptr cuchar
  Library* = pointer
  Module* = pointer
  Driver* = pointer
  Renderer* = pointer

const 
  GLYPH_FORMAT_NONE* = (
    (clong(0) shl 24) or (clong(0) shl 16) or (clong(0) shl 8) or clong(0))
  GLYPH_FORMAT_COMPOSITE* = ((clong('c') shl 24) or (clong('o') shl 16) or
      (clong('m') shl 8) or clong('p'))
  GLYPH_FORMAT_BITMAP* = ((clong('b') shl 24) or (clong('i') shl 16) or
      (clong('t') shl 8) or clong('s'))
  GLYPH_FORMAT_OUTLINE* = ((clong('o') shl 24) or (clong('u') shl 16) or
      (clong('t') shl 8) or clong('l'))
  GLYPH_FORMAT_PLOTTER* = ((clong('p') shl 24) or (clong('l') shl 16) or
      (clong('o') shl 8) or clong('t'))
  GLYPH_BBOX_UNSCALED* = 0
  GLYPH_BBOX_SUBPIXELS* = 0
  GLYPH_BBOX_GRIDFIT* = 1
  GLYPH_BBOX_TRUNCATE* = 2
  GLYPH_BBOX_PIXELS* = 3
  STROKER_LINEJOIN_ROUND* = 0
  STROKER_LINEJOIN_BEVEL* = 1
  STROKER_LINEJOIN_MITER_VARIABLE* = 2
  STROKER_LINEJOIN_MITER* = 2
  STROKER_LINEJOIN_MITER_FIXED* = 3
  ORIENTATION_TRUETYPE* = 0
  ORIENTATION_POSTSCRIPT* = 1
  ORIENTATION_FILL_RIGHT* = 0
  ORIENTATION_FILL_LEFT* = 1
  ORIENTATION_NONE* = 2
  ENCODING_NONE* = (
    (int32(0) shl 24) or (int32(0) shl 16) or (int32(0) shl 8) or int32(0))
  ENCODING_ADOBE_CUSTOM* = ((int32('A') shl 24) or (int32('D') shl 16) or
      (int32('B') shl 8) or int32('C'))
  ENCODING_ADOBE_EXPERT* = ((int32('A') shl 24) or (int32('D') shl 16) or
      (int32('B') shl 8) or int32('E'))
  ENCODING_ADOBE_STANDARD* = ((int32('A') shl 24) or (int32('D') shl 16) or
      (int32('O') shl 8) or int32('B'))
  ENCODING_APPLE_ROMAN* = ((int32('a') shl 24) or (int32('r') shl 16) or
      (int32('m') shl 8) or int32('n'))
  ENCODING_BIG5* = ((int32('b') shl 24) or (int32('i') shl 16) or
      (int32('g') shl 8) or int32('5'))
  ENCODING_GB2312* = ((int32('g') shl 24) or (int32('b') shl 16) or
      (int32(' ') shl 8) or int32(' '))
  ENCODING_JOHAB* = ((int32('j') shl 24) or (int32('o') shl 16) or
      (int32('h') shl 8) or int32('a'))
  ENCODING_ADOBE_LATIN_1* = ((int32('l') shl 24) or (int32('a') shl 16) or
      (int32('t') shl 8) or int32('1'))
  ENCODING_OLD_LATIN_2* = ((int32('l') shl 24) or (int32('a') shl 16) or
      (int32('t') shl 8) or int32('2'))
  ENCODING_SJIS* = ((int32('s') shl 24) or (int32('j') shl 16) or
      (int32('i') shl 8) or int32('s'))
  ENCODING_MS_SYMBOL* = ((int32('s') shl 24) or (int32('y') shl 16) or
      (int32('m') shl 8) or int32('b'))
  ENCODING_UNICODE* = ((int32('u') shl 24) or (int32('n') shl 16) or
      (int32('i') shl 8) or int32('c'))
  ENCODING_WANSUNG* = ((int32('w') shl 24) or (int32('a') shl 16) or
      (int32('n') shl 8) or int32('s'))
  RENDER_MODE_NORMAL* = 0
  RENDER_MODE_LIGHT* = 1
  RENDER_MODE_MONO* = 2
  RENDER_MODE_LCD* = 3
  RENDER_MODE_LCD_V* = 4
  RENDER_MODE_MAX* = 5
  KERNING_DEFAULT* = 0
  KERNING_UNFITTED* = 1
  KERNING_UNSCALED* = 2
  FACE_FLAG_SCALABLE* = (1 shl 0)
  FACE_FLAG_FIXED_SIZES* = (1 shl 1)
  FACE_FLAG_FIXED_WIDTH* = (1 shl 2)
  FACE_FLAG_SFNT* = (1 shl 3)
  FACE_FLAG_HORIZONTAL* = (1 shl 4)
  FACE_FLAG_VERTICAL* = (1 shl 5)
  FACE_FLAG_KERNING* = (1 shl 6)
  FACE_FLAG_FAST_GLYPHS* = (1 shl 7)
  FACE_FLAG_MULTIPLE_MASTERS* = (1 shl 8)
  FACE_FLAG_GLYPH_NAMES* = (1 shl 9)
  FACE_FLAG_EXTERNAL_STREAM* = (1 shl 10)
  FACE_FLAG_HINTER* = (1 shl 11)
  FACE_FLAG_CID_KEYED* = (1 shl 12)
  FACE_FLAG_TRICKY* = (1 shl 13)
  FACE_FLAG_COLOR* = (1 shl 14)

template has_Horizontal*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_HORIZONTAL)

template has_Vertical*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_VERTICAL)

template has_Kerning*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_KERNING)

template is_Scalable*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_SCALABLE)

template is_Sfnt*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_SFNT)

template is_Fixed_Width*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_FIXED_WIDTH)

template has_Fixed_Sizes*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_FIXED_SIZES)

template has_Fast_Glyphs*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_FAST_GLYPHS)

template has_Glyph_Names*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_GLYPH_NAMES)

template has_Multiple_Masters*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_MULTIPLE_MASTERS)

template is_Cid_Keyed*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_CID_KEYED)

template is_Tricky*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_TRICKY)

template has_Color*(face: expr): expr = 
  (face.faceFlags and FACE_FLAG_COLOR)

const 
  STYLE_FLAG_ITALIC* = (1 shl 0)
  STYLE_FLAG_BOLD* = (1 shl 1)
  OPEN_MEMORY* = 0x00000001
  OPEN_STREAM* = 0x00000002
  OPEN_PATHNAME* = 0x00000004
  OPEN_DRIVER* = 0x00000008
  OPEN_PARAMS* = 0x00000010
  LOAD_DEFAULT* = 0x00000000
  LOAD_NO_SCALE* = (1 shl 0)
  LOAD_NO_HINTING* = (1 shl 1)
  LOAD_RENDER* = (1 shl 2)
  LOAD_NO_BITMAP* = (1 shl 3)
  LOAD_VERTICAL_LAYOUT* = (1 shl 4)
  LOAD_FORCE_AUTOHINT* = (1 shl 5)
  LOAD_CROP_BITMAP* = (1 shl 6)
  LOAD_PEDANTIC* = (1 shl 7)
  LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH* = (1 shl 9)
  LOAD_NO_RECURSE* = (1 shl 10)
  LOAD_IGNORE_TRANSFORM* = (1 shl 11)
  LOAD_MONOCHROME* = (1 shl 12)
  LOAD_LINEAR_DESIGN* = (1 shl 13)
  LOAD_NO_AUTOHINT* = (1 shl 15)
  LOAD_COLOR* = (1 shl 20)
  LOAD_ADVANCE_ONLY* = (1 shl 8)
  LOAD_SBITS_ONLY* = (1 shl 14)

template load_Target*(x: expr): expr = 
  ((int32)((x) and 15) shl 16)

const 
  LOAD_TARGET_NORMAL* = load_Target(RENDER_MODE_NORMAL)
  LOAD_TARGET_LIGHT* = load_Target(RENDER_MODE_LIGHT)
  LOAD_TARGET_MONO* = load_Target(RENDER_MODE_MONO)
  LOAD_TARGET_LCD* = load_Target(RENDER_MODE_LCD)
  LOAD_TARGET_LCD_V* = load_Target(RENDER_MODE_LCD_V)

template load_Target_Mode*(x: expr): expr = 
  ((cint)(((x) shr 16) and 15))

const 
  SUBGLYPH_FLAG_ARGS_ARE_WORDS* = 1
  SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES* = 2
  SUBGLYPH_FLAG_ROUND_XY_TO_GRID* = 4
  SUBGLYPH_FLAG_SCALE* = 8
  SUBGLYPH_FLAG_XY_SCALE* = 0x00000040
  SUBGLYPH_FLAG_2X2* = 0x00000080
  SUBGLYPH_FLAG_USE_MY_METRICS* = 0x00000200
  FSTYPE_INSTALLABLE_EMBEDDING* = 0x00000000
  FSTYPE_RESTRICTED_LICENSE_EMBEDDING* = 0x00000002
  FSTYPE_PREVIEW_AND_PRINT_EMBEDDING* = 0x00000004
  FSTYPE_EDITABLE_EMBEDDING* = 0x00000008
  FSTYPE_NO_SUBSETTING* = 0x00000100
  FSTYPE_BITMAP_EMBEDDING_ONLY* = 0x00000200
  FREETYPE_MAJOR* = 2
  FREETYPE_MINOR* = 5
  FREETYPE_PATCH* = 2

const 
  ErrOk* = 0x00000000
  ErrCannotOpenResource* = 0x00000001
  ErrUnknownFileFormat* = 0x00000002
  ErrInvalidFileFormat* = 0x00000003
  ErrInvalidVersion* = 0x00000004
  ErrLowerModuleVersion* = 0x00000005
  ErrInvalidArgument* = 0x00000006
  ErrUnimplementedFeature* = 0x00000007
  ErrInvalidTable* = 0x00000008
  ErrInvalidOffset* = 0x00000009
  ErrArrayTooLarge* = 0x0000000A
  ErrMissingModule* = 0x0000000B
  ErrMissingProperty* = 0x0000000C
  ErrInvalidGlyphIndex* = 0x00000010
  ErrInvalidCharacterCode* = 0x00000011
  ErrInvalidGlyphFormat* = 0x00000012
  ErrCannotRenderGlyph* = 0x00000013
  ErrInvalidOutline* = 0x00000014
  ErrInvalidComposite* = 0x00000015
  ErrTooManyHints* = 0x00000016
  ErrInvalidPixelSize* = 0x00000017
  ErrInvalidHandle* = 0x00000020
  ErrInvalidLibraryHandle* = 0x00000021
  ErrInvalidDriverHandle* = 0x00000022
  ErrInvalidFaceHandle* = 0x00000023
  ErrInvalidSizeHandle* = 0x00000024
  ErrInvalidSlotHandle* = 0x00000025
  ErrInvalidCharMapHandle* = 0x00000026
  ErrInvalidCacheHandle* = 0x00000027
  ErrInvalidStreamHandle* = 0x00000028
  ErrTooManyDrivers* = 0x00000030
  ErrTooManyExtensions* = 0x00000031
  ErrOutOfMemory* = 0x00000040
  ErrUnlistedObject* = 0x00000041
  ErrCannotOpenStream* = 0x00000051
  ErrInvalidStreamSeek* = 0x00000052
  ErrInvalidStreamSkip* = 0x00000053
  ErrInvalidStreamRead* = 0x00000054
  ErrInvalidStreamOperation* = 0x00000055
  ErrInvalidFrameOperation* = 0x00000056
  ErrNestedFrameAccess* = 0x00000057
  ErrInvalidFrameRead* = 0x00000058
  ErrRasterUninitialized* = 0x00000060
  ErrRasterCorrupted* = 0x00000061
  ErrRasterOverflow* = 0x00000062
  ErrRasterNegativeHeight* = 0x00000063
  ErrTooManyCaches* = 0x00000070
  ErrInvalidOpcode* = 0x00000080
  ErrTooFewArguments* = 0x00000081
  ErrStackOverflow* = 0x00000082
  ErrCodeOverflow* = 0x00000083
  ErrBadArgument* = 0x00000084
  ErrDivideByZero* = 0x00000085
  ErrInvalidReference* = 0x00000086
  ErrDebugOpCode* = 0x00000087
  ErrENDF_InExecStream* = 0x00000088
  ErrNestedDEFS* = 0x00000089
  ErrInvalidCodeRange* = 0x0000008A
  ErrExecutionTooLong* = 0x0000008B
  ErrTooManyFunctionDefs* = 0x0000008C
  ErrTooManyInstructionDefs* = 0x0000008D
  ErrTableMissing* = 0x0000008E
  ErrHorizHeaderMissing* = 0x0000008F
  ErrLocationsMissing* = 0x00000090
  ErrNameTableMissing* = 0x00000091
  ErrCMapTableMissing* = 0x00000092
  ErrHmtxTableMissing* = 0x00000093
  ErrPostTableMissing* = 0x00000094
  ErrInvalidHorizMetrics* = 0x00000095
  ErrInvalidCharMapFormat* = 0x00000096
  ErrInvalidPPem* = 0x00000097
  ErrInvalidVertMetrics* = 0x00000098
  ErrCouldNotFindContext* = 0x00000099
  ErrInvalidPostTableFormat* = 0x0000009A
  ErrInvalidPostTable* = 0x0000009B
  ErrSyntaxError* = 0x000000A0
  ErrStackUnderflow* = 0x000000A1
  ErrIgnore* = 0x000000A2
  ErrNoUnicodeGlyphName* = 0x000000A3
  ErrGlyphTooBig* = 0x000000A4
  ErrMissingStartfontField* = 0x000000B0
  ErrMissingFontField* = 0x000000B1
  ErrMissingSizeField* = 0x000000B2
  ErrMissingFontboundingboxField* = 0x000000B3
  ErrMissingCharsField* = 0x000000B4
  ErrMissingStartcharField* = 0x000000B5
  ErrMissingEncodingField* = 0x000000B6
  ErrMissingBbxField* = 0x000000B7
  ErrBbxTooBig* = 0x000000B8
  ErrCorruptedFontHeader* = 0x000000B9
  ErrCorruptedFontGlyphs* = 0x000000BA
  ErrMax* = 0x000000BB

type 
  INNER_C_UNION_12042191225943099359* = object  {.union.}
    atom*: cstring
    integer*: int32
    cardinal*: uint32

  SizeInternal* = pointer
  SizeRec* = object 
    face*: Face
    generi*: Generic
    metrics*: SizeMetrics
    internal*: SizeInternal

  Size* = ptr SizeRec
  Vector* = object 
    x*: clong
    y*: clong

  BBox* = object 
    xMin*: clong
    yMin*: clong
    xMax*: clong
    yMax*: clong

  GenericFinalizer* = proc (objet: pointer) {.cdecl.}
  Generic* = object 
    data*: pointer
    finalizer*: GenericFinalizer

  BitmapSize* = object 
    height*: cshort
    width*: cshort
    size*: clong
    xPpem*: clong
    yPpem*: clong

  CharMapRec* = object 
    face*: Face
    encoding*: cint
    platformId*: cushort
    encodingId*: cushort

  CharMap* = ptr CharMapRec
  SizeMetrics* = object 
    xPpem*: cushort
    yPpem*: cushort
    xScale*: clong
    yScale*: clong
    ascender*: clong
    descender*: clong
    height*: clong
    maxAdvance*: clong

  FaceInternal* = pointer
  FaceRec* = object 
    numFaces*: clong
    faceIndex*: clong
    faceFlags*: clong
    styleFlags*: clong
    numGlyphs*: clong
    familyName*: cstring
    styleName*: cstring
    numFixedSizes*: cint
    availableSizes*: ptr BitmapSize
    numCharmaps*: cint
    charmaps*: ptr CharMap
    generi*: Generic
    bbox*: BBox
    unitsPerEM*: cushort
    ascender*: cshort
    descender*: cshort
    height*: cshort
    maxAdvanceWidth*: cshort
    maxAdvanceHeight*: cshort
    underlinePosition*: cshort
    underlineThickness*: cshort
    glyph*: GlyphSlot
    size*: Size
    charmap*: CharMap
    driver*: Driver
    memory*: Memory
    stream*: Stream
    sizesList*: ListRec
    autohint*: Generic
    extensions*: pointer
    internal*: FaceInternal

  Face* = ptr FaceRec
  GlyphSlotRec* = object 
    library*: Library
    face*: Face
    next*: GlyphSlot
    reserved*: cuint
    generi*: Generic
    metrics*: GlyphMetrics
    linearHoriAdvance*: clong
    linearVertAdvance*: clong
    advance*: Vector
    format*: clong
    bitmap*: Bitmap
    bitmapLeft*: cint
    bitmapTop*: cint
    outline*: Outline
    numSubglyphs*: cuint
    subglyphs*: SubGlyph
    controlData*: pointer
    controlLen*: clong
    lsbDelta*: clong
    rsbDelta*: clong
    other*: pointer
    internal*: SlotInternal

  GlyphSlot* = ptr GlyphSlotRec
  PropGlyphToScriptMap* = object 
    face*: Face
    map*: ptr cuchar

  PropIncreaseXHeight* = object 
    face*: Face
    limit*: cuint

  PropertyType* {.size: sizeof(cint).} = enum 
    PROPERTY_TYPE_NONE = 0, PROPERTY_TYPE_ATOM = 1, PROPERTY_TYPE_INTEGER = 2, 
    PROPERTY_TYPE_CARDINAL = 3
  PropertyRec* = object 
    typ*: PropertyType
    u*: INNER_C_UNION_12042191225943099359

  Property* = ptr PropertyRec
  FTC_FaceID* = pointer
  FTC_FaceRequester* = proc (faceId: FTC_FaceID; library: Library; 
                             requestData: pointer; aface: ptr Face): cint {.
      cdecl.}
  FTC_Manager* = pointer
  FTC_Node* = pointer
  FTC_ScalerRec* = object 
    faceId*: FTC_FaceID
    width*: cuint
    height*: cuint
    pixel*: cint
    xRes*: cuint
    yRes*: cuint

  FTC_Scaler* = ptr FTC_ScalerRec
  FTC_CMapCache* = pointer
  FTC_ImageTypeRec* = object 
    faceId*: FTC_FaceID
    width*: cint
    height*: cint
    flags*: int32

  FTC_ImageType* = ptr FTC_ImageTypeRec
  FTC_ImageCache* = pointer
  FTC_SBit* = ptr FTC_SBitRec
  FTC_SBitRec* = object 
    width*: cuchar
    height*: cuchar
    left*: cchar
    top*: cchar
    format*: cuchar
    maxGrays*: cuchar
    pitch*: cshort
    xadvance*: cchar
    yadvance*: cchar
    buffer*: ptr cuchar

  FTC_SBitCache* = pointer
  Incremental* = pointer
  IncrementalMetricsRec* = object 
    bearingX*: clong
    bearingY*: clong
    advance*: clong
    advanceV*: clong

  IncrementalMetrics* = ptr IncrementalMetricsRec
  IncrementalGetGlyphDataFunc* = proc (incremental: Incremental; 
                                       glyphIndex: cuint; adata: ptr Data): cint {.
      cdecl.}
  IncrementalFreeGlyphDataFunc* = proc (incremental: Incremental; data: ptr Data) {.
      cdecl.}
  IncrementalGetGlyphMetricsFunc* = proc (incremental: Incremental; 
      glyphIndex: cuint; vertical: cuchar; ametrics: ptr IncrementalMetricsRec): cint {.
      cdecl.}
  IncrementalFuncsRec* = object 
    getGlyphData*: IncrementalGetGlyphDataFunc
    freeGlyphData*: IncrementalFreeGlyphDataFunc
    getGlyphMetrics*: IncrementalGetGlyphMetricsFunc

  IncrementalInterfaceRec* = object 
    funcs*: ptr IncrementalFuncsRec
    objet*: Incremental

  IncrementalInterface* = ptr IncrementalInterfaceRec
  LcdFilter* {.size: sizeof(cint).} = enum 
    LCD_FILTER_NONE = 0, LCD_FILTER_DEFAULT = 1, LCD_FILTER_LIGHT = 2, 
    LCD_FILTER_LEGACY = 16, LCD_FILTER_MAX
  ListIterator* = proc (node: ListNode; user: pointer): cint {.cdecl.}
  ListDestructor* = proc (memory: Memory; data: pointer; user: pointer) {.cdecl.}
  FontInfoRec* = object 
    version*: cstring
    notice*: cstring
    fullName*: cstring
    familyName*: cstring
    weight*: cstring
    italicAngle*: clong
    isFixedPitch*: cuchar
    underlinePosition*: cshort
    underlineThickness*: cushort

  FontInfo* = ptr FontInfoRec
  PrivateRec* = object 
    uniqueId*: cint
    lenIV*: cint
    numBlueValues*: cuchar
    numOtherBlues*: cuchar
    numFamilyBlues*: cuchar
    numFamilyOtherBlues*: cuchar
    blueValues*: array[14, cshort]
    otherBlues*: array[10, cshort]
    familyBlues*: array[14, cshort]
    familyOtherBlues*: array[10, cshort]
    blueScale*: clong
    blueShift*: cint
    blueFuzz*: cint
    standardWidth*: array[1, cushort]
    standardHeight*: array[1, cushort]
    numSnapWidths*: cuchar
    numSnapHeights*: cuchar
    forceBold*: cuchar
    roundStemUp*: cuchar
    snapWidths*: array[13, cshort]
    snapHeights*: array[13, cshort]
    expansionFactor*: clong
    languageGroup*: clong
    password*: clong
    minFeature*: array[2, cshort]

  Private* = ptr PrivateRec
  BlendFlags* {.size: sizeof(cint).} = enum 
    BLEND_UNDERLINE_POSITION = 0, BLEND_UNDERLINE_THICKNESS, BLEND_ITALIC_ANGLE, 
    BLEND_BLUE_VALUES, BLEND_OTHER_BLUES, BLEND_STANDARD_WIDTH, 
    BLEND_STANDARD_HEIGHT, BLEND_STEM_SNAP_WIDTHS, BLEND_STEM_SNAP_HEIGHTS, 
    BLEND_BLUE_SCALE, BLEND_BLUE_SHIFT, BLEND_FAMILY_BLUES, 
    BLEND_FAMILY_OTHER_BLUES, BLEND_FORCE_BOLD, BLEND_MAX
  DesignMapRec* = object 
    numPoints*: cuchar
    designPoints*: ptr clong
    blendPoints*: ptr clong

  DesignMap* = ptr DesignMapRec
  BlendRec* = object 
    numDesigns*: cuint
    numAxis*: cuint
    axisNames*: array[4, cstring]
    designPos*: array[16, ptr clong]
    designMap*: array[4, DesignMapRec]
    weightVector*: ptr clong
    defaultWeightVector*: ptr clong
    fontInfos*: array[16 + 1, FontInfo]
    privates*: array[16 + 1, Private]
    blendBitflags*: culong
    bboxes*: array[16 + 1, ptr BBox]
    defaultDesignVector*: array[16, cuint]
    numDefaultDesignVector*: cuint

  Blend* = ptr BlendRec
  FaceDictRec* = object 
    privateDict*: PrivateRec
    lenBuildchar*: cuint
    forceboldThreshold*: clong
    strokeWidth*: clong
    expansionFactor*: clong
    paintType*: cuchar
    fontType*: cuchar
    fontMatrix*: Matrix
    fontOffset*: Vector
    numSubrs*: cuint
    subrmapOffset*: culong
    sdBytes*: cint

  FaceDict* = ptr FaceDictRec
  FontDict* = FaceDictRec
  FaceInfoRec* = object 
    cidFontName*: cstring
    cidVersion*: clong
    cidFontType*: cint
    registry*: cstring
    ordering*: cstring
    supplement*: cint
    fontInfo*: FontInfoRec
    fontBbox*: BBox
    uidBase*: culong
    numXuid*: cint
    xuid*: array[16, culong]
    cidmapOffset*: culong
    fdBytes*: cint
    gdBytes*: cint
    cidCount*: culong
    numDicts*: cint
    fontDicts*: FaceDict
    dataOffset*: culong

  FaceInfo* = ptr FaceInfoRec
  Info* = FaceInfoRec
  EncodingType* {.size: sizeof(cint).} = enum 
    ENCODING_TYPE_NONE = 0, ENCODING_TYPE_ARRAY, ENCODING_TYPE_STANDARD, 
    ENCODING_TYPE_ISOLATIN1, ENCODING_TYPE_EXPERT
  DictKeys* {.size: sizeof(cint).} = enum 
    DICT_FONT_TYPE, DICT_FONT_MATRIX, DICT_FONT_BBOX, DICT_PAINT_TYPE, 
    DICT_FONT_NAME, DICT_UNIQUE_ID, DICT_NUM_CHAR_STRINGS, DICT_CHAR_STRING_KEY, 
    DICT_CHAR_STRING, DICT_ENCODING_TYPE, DICT_ENCODING_ENTRY, DICT_NUM_SUBRS, 
    DICT_SUBR, DICT_STD_HW, DICT_STD_VW, DICT_NUM_BLUE_VALUES, DICT_BLUE_VALUE, 
    DICT_BLUE_FUZZ, DICT_NUM_OTHER_BLUES, DICT_OTHER_BLUE, 
    DICT_NUM_FAMILY_BLUES, DICT_FAMILY_BLUE, DICT_NUM_FAMILY_OTHER_BLUES, 
    DICT_FAMILY_OTHER_BLUE, DICT_BLUE_SCALE, DICT_BLUE_SHIFT, 
    DICT_NUM_STEM_SNAP_H, DICT_STEM_SNAP_H, DICT_NUM_STEM_SNAP_V, 
    DICT_STEM_SNAP_V, DICT_FORCE_BOLD, DICT_RND_STEM_UP, DICT_MIN_FEATURE, 
    DICT_LEN_IV, DICT_PASSWORD, DICT_LANGUAGE_GROUP, DICT_VERSION, DICT_NOTICE, 
    DICT_FULL_NAME, DICT_FAMILY_NAME, DICT_WEIGHT, DICT_IS_FIXED_PITCH, 
    DICT_UNDERLINE_POSITION, DICT_UNDERLINE_THICKNESS, DICT_FS_TYPE, 
    DICT_ITALIC_ANGLE, DICT_MAX
  MM_Axis* = object 
    name*: cstring
    minimum*: clong
    maximum*: clong

  MultiMaster* = object 
    numAxis*: cuint
    numDesigns*: cuint
    axis*: array[4, MM_Axis]

  VarAxis* = object 
    name*: cstring
    minimum*: clong
    def*: clong
    maximum*: clong
    tag*: culong
    strid*: cuint

  VarNamedStyle* = object 
    coords*: ptr clong
    strid*: cuint

  MM_Var* = object 
    numAxis*: cuint
    numDesigns*: cuint
    numNamedstyles*: cuint
    axis*: ptr VarAxis
    namedstyle*: ptr VarNamedStyle

  ModuleInterface* = pointer
  ModuleConstructor* = proc (module: Module): cint {.cdecl.}
  ModuleDestructor* = proc (module: Module) {.cdecl.}
  ModuleRequester* = proc (module: Module; name: cstring): ModuleInterface {.
      cdecl.}
  ModuleClass* = object 
    moduleFlags*: culong
    moduleSize*: clong
    moduleName*: cstring
    moduleVersion*: clong
    moduleRequires*: clong
    moduleInterface*: pointer
    moduleInit*: ModuleConstructor
    moduleDone*: ModuleDestructor
    getInterface*: ModuleRequester

  DebugHookFunc* = proc (arg: pointer) {.cdecl.}
  TrueTypeEngineType* {.size: sizeof(cint).} = enum 
    TRUETYPE_ENGINE_TYPE_NONE = 0, TRUETYPE_ENGINE_TYPE_UNPATENTED, 
    TRUETYPE_ENGINE_TYPE_PATENTED
  GlyphInitFunc* = proc (glyph: Glyph; slot: GlyphSlot): cint {.cdecl.}
  GlyphDoneFunc* = proc (glyph: Glyph) {.cdecl.}
  GlyphTransformFunc* = proc (glyph: Glyph; matrix: ptr Matrix; 
                              delta: ptr Vector) {.cdecl.}
  GlyphGetBBoxFunc* = proc (glyph: Glyph; abbox: ptr BBox) {.cdecl.}
  GlyphCopyFunc* = proc (source: Glyph; target: Glyph): cint {.cdecl.}
  GlyphPrepareFunc* = proc (glyph: Glyph; slot: GlyphSlot): cint {.cdecl.}
  GlyphClass* = object 
    glyphSize*: clong
    glyphFormat*: clong
    glyphInit*: GlyphInitFunc
    glyphDone*: GlyphDoneFunc
    glyphCopy*: GlyphCopyFunc
    glyphTransform*: GlyphTransformFunc
    glyphBbox*: GlyphGetBBoxFunc
    glyphPrepare*: GlyphPrepareFunc

  RendererRenderFunc* = proc (renderer: Renderer; slot: GlyphSlot; mode: cuint; 
                              origin: ptr Vector): cint {.cdecl.}
  RendererTransformFunc* = proc (renderer: Renderer; slot: GlyphSlot; 
                                 matrix: ptr Matrix; delta: ptr Vector): cint {.
      cdecl.}
  RendererGetCBoxFunc* = proc (renderer: Renderer; slot: GlyphSlot; 
                               cbox: ptr BBox) {.cdecl.}
  RendererSetModeFunc* = proc (renderer: Renderer; modeTag: culong; 
                               modePtr: pointer): cint {.cdecl.}
  RendererClass* = object 
    root*: ModuleClass
    glyphFormat*: clong
    renderGlyph*: RendererRenderFunc
    transformGlyph*: RendererTransformFunc
    getGlyphCbox*: RendererGetCBoxFunc
    setMode*: RendererSetModeFunc
    rasterClass*: ptr RasterFuncs

  SfntName* = object 
    platformId*: cushort
    encodingId*: cushort
    languageId*: cushort
    nameId*: cushort
    string*: ptr cuchar
    stringLen*: cuint

  Glyph* = ptr GlyphRec
  GlyphRec* = object 
    library*: Library
    clazz*: ptr GlyphClass
    format*: clong
    advance*: Vector

  BitmapGlyph* = ptr BitmapGlyphRec
  BitmapGlyphRec* = object 
    root*: GlyphRec
    left*: cint
    top*: cint
    bitmap*: Bitmap

  OutlineGlyph* = ptr OutlineGlyphRec
  OutlineGlyphRec* = object 
    root*: GlyphRec
    outline*: Outline

  Stroker* = pointer
  StrokerLineCap* {.size: sizeof(cint).} = enum 
    STROKER_LINECAP_BUTT = 0, STROKER_LINECAP_ROUND, STROKER_LINECAP_SQUARE
  StrokerBorder* {.size: sizeof(cint).} = enum 
    STROKER_BORDER_LEFT = 0, STROKER_BORDER_RIGHT
  WinFNT_HeaderRec* = object 
    version*: cushort
    fileSize*: culong
    copyright*: array[60, cuchar]
    fileType*: cushort
    nominalPointSize*: cushort
    verticalResolution*: cushort
    horizontalResolution*: cushort
    ascent*: cushort
    internalLeading*: cushort
    externalLeading*: cushort
    italic*: cuchar
    underline*: cuchar
    strikeOut*: cuchar
    weight*: cushort
    charset*: cuchar
    pixelWidth*: cushort
    pixelHeight*: cushort
    pitchAndFamily*: cuchar
    avgWidth*: cushort
    maxWidth*: cushort
    firstChar*: cuchar
    lastChar*: cuchar
    defaultChar*: cuchar
    breakChar*: cuchar
    bytesPerRow*: cushort
    deviceOffset*: culong
    faceNameOffset*: culong
    bitsPointer*: culong
    bitsOffset*: culong
    reserved*: cuchar
    flags*: culong
    a_space*: cushort
    b_space*: cushort
    c_space*: cushort
    colorTableOffset*: cushort
    reserved1*: array[4, culong]

  WinFNT_Header* = ptr WinFNT_HeaderRec
  Header* = object 
    tableVersion*: clong
    fontRevision*: clong
    checkSumAdjust*: clong
    magicNumber*: clong
    flags*: cushort
    unitsPerEM*: cushort
    created*: array[2, clong]
    modified*: array[2, clong]
    xMin*: cshort
    yMin*: cshort
    xMax*: cshort
    yMax*: cshort
    macStyle*: cushort
    lowestRecPPEM*: cushort
    fontDirection*: cshort
    indexToLocFormat*: cshort
    glyphDataFormat*: cshort

  HoriHeader* = object 
    version*: clong
    ascender*: cshort
    descender*: cshort
    lineGap*: cshort
    advanceWidthMax*: cushort
    minLeftSideBearing*: cshort
    minRightSideBearing*: cshort
    xMaxExtent*: cshort
    caretSlopeRise*: cshort
    caretSlopeRun*: cshort
    caretOffset*: cshort
    reserved*: array[4, cshort]
    metricDataFormat*: cshort
    numberOfHMetrics*: cushort
    longMetrics*: pointer
    shortMetrics*: pointer

  VertHeader* = object 
    version*: clong
    ascender*: cshort
    descender*: cshort
    lineGap*: cshort
    advanceHeightMax*: cushort
    minTopSideBearing*: cshort
    minBottomSideBearing*: cshort
    yMaxExtent*: cshort
    caretSlopeRise*: cshort
    caretSlopeRun*: cshort
    caretOffset*: cshort
    reserved*: array[4, cshort]
    metricDataFormat*: cshort
    numberOfVMetrics*: cushort
    longMetrics*: pointer
    shortMetrics*: pointer

  Os2* = object 
    version*: cushort
    xAvgCharWidth*: cshort
    usWeightClass*: cushort
    usWidthClass*: cushort
    fsType*: cshort
    ySubscriptXSize*: cshort
    ySubscriptYSize*: cshort
    ySubscriptXOffset*: cshort
    ySubscriptYOffset*: cshort
    ySuperscriptXSize*: cshort
    ySuperscriptYSize*: cshort
    ySuperscriptXOffset*: cshort
    ySuperscriptYOffset*: cshort
    yStrikeoutSize*: cshort
    yStrikeoutPosition*: cshort
    sFamilyClass*: cshort
    panose*: array[10, cuchar]
    ulUnicodeRange1*: culong
    ulUnicodeRange2*: culong
    ulUnicodeRange3*: culong
    ulUnicodeRange4*: culong
    achVendID*: array[4, cchar]
    fsSelection*: cushort
    usFirstCharIndex*: cushort
    usLastCharIndex*: cushort
    sTypoAscender*: cshort
    sTypoDescender*: cshort
    sTypoLineGap*: cshort
    usWinAscent*: cushort
    usWinDescent*: cushort
    ulCodePageRange1*: culong
    ulCodePageRange2*: culong
    sxHeight*: cshort
    sCapHeight*: cshort
    usDefaultChar*: cushort
    usBreakChar*: cushort
    usMaxContext*: cushort
    usLowerOpticalPointSize*: cushort
    usUpperOpticalPointSize*: cushort

  Postscript* = object 
    formatType*: clong
    italicAngle*: clong
    underlinePosition*: cshort
    underlineThickness*: cshort
    isFixedPitch*: culong
    minMemType42*: culong
    maxMemType42*: culong
    minMemType1*: culong
    maxMemType1*: culong

  Pclt* = object 
    version*: clong
    fontNumber*: culong
    pitch*: cushort
    xHeight*: cushort
    style*: cushort
    typeFamily*: cushort
    capHeight*: cushort
    symbolSet*: cushort
    typeFace*: array[16, cchar]
    characterComplement*: array[8, cchar]
    fileName*: array[6, cchar]
    strokeWeight*: cchar
    widthType*: cchar
    serifStyle*: cuchar
    reserved*: cuchar

  MaxProfile* = object 
    version*: clong
    numGlyphs*: cushort
    maxPoints*: cushort
    maxContours*: cushort
    maxCompositePoints*: cushort
    maxCompositeContours*: cushort
    maxZones*: cushort
    maxTwilightPoints*: cushort
    maxStorage*: cushort
    maxFunctionDefs*: cushort
    maxInstructionDefs*: cushort
    maxStackElements*: cushort
    maxSizeOfInstructions*: cushort
    maxComponentElements*: cushort
    maxComponentDepth*: cushort

  SfntTag* {.size: sizeof(cint).} = enum 
    ftSfntHead = 0, ftSfntMaxp = 1, ftSfntOs2 = 2, ftSfntHhea = 3, 
    ftSfntVhea = 4, ftSfntPost = 5, ftSfntPclt = 6, sfntMax
  Memory* = object 
    user*: pointer
    alloc*: AllocFunc
    free*: FreeFunc
    realloc*: ReallocFunc

  AllocFunc* = proc (memory: Memory; size: clong): pointer {.cdecl.}
  FreeFunc* = proc (memory: Memory; bloc: pointer) {.cdecl.}
  ReallocFunc* = proc (memory: Memory; curSize: clong; newSize: clong; 
                       bloc: pointer): pointer {.cdecl.}
  Stream* = ptr StreamRec
  StreamDesc* = object  {.union.}
    value*: clong
    pointer*: pointer

  StreamIoFunc* = proc (stream: Stream; offset: culong; buffer: ptr cuchar; 
                        count: culong): culong {.cdecl.}
  StreamCloseFunc* = proc (stream: Stream) {.cdecl.}
  StreamRec* = object 
    base*: ptr cuchar
    size*: culong
    pos*: culong
    descriptor*: StreamDesc
    pathname*: StreamDesc
    read*: StreamIoFunc
    close*: StreamCloseFunc
    memory*: Memory
    cursor*: ptr cuchar
    limit*: ptr cuchar

  PixelMode* {.size: sizeof(cint).} = enum 
    PIXEL_MODE_NONE = 0, PIXEL_MODE_MONO, PIXEL_MODE_GRAY, PIXEL_MODE_GRAY2, 
    PIXEL_MODE_GRAY4, PIXEL_MODE_LCD, PIXEL_MODE_LCD_V, PIXEL_MODE_BGRA, 
    PIXEL_MODE_MAX
  Bitmap* = object 
    rows*: cuint
    width*: cuint
    pitch*: cint
    buffer*: ptr cuchar
    numGrays*: cushort
    pixelMode*: cuchar
    paletteMode*: cuchar
    palette*: pointer

  Outline* = object 
    nContours*: cshort
    nPoints*: cshort
    points*: ptr Vector
    tags*: cstring
    contours*: ptr cshort
    flags*: cint

  OutlineMoveToFunc* = proc (to: ptr Vector; user: pointer): cint {.cdecl.}
  OutlineLineToFunc* = proc (to: ptr Vector; user: pointer): cint {.cdecl.}
  OutlineConicToFunc* = proc (control: ptr Vector; to: ptr Vector; user: pointer): cint {.
      cdecl.}
  OutlineCubicToFunc* = proc (control1: ptr Vector; control2: ptr Vector; 
                              to: ptr Vector; user: pointer): cint {.cdecl.}
  OutlineFuncs* = object 
    moveTo*: OutlineMoveToFunc
    lineTo*: OutlineLineToFunc
    conicTo*: OutlineConicToFunc
    cubicTo*: OutlineCubicToFunc
    shift*: cint
    delta*: clong

  Raster* = pointer
  Span* = object 
    x*: cshort
    len*: cushort
    coverage*: cuchar

  SpanFunc* = proc (y: cint; count: cint; spans: ptr Span; user: pointer) {.
      cdecl.}
  RasterBitTestFunc* = proc (y: cint; x: cint; user: pointer): cint {.cdecl.}
  RasterBitSetFunc* = proc (y: cint; x: cint; user: pointer) {.cdecl.}
  RasterParams* = object 
    target*: ptr Bitmap
    source*: pointer
    flags*: cint
    graySpans*: SpanFunc
    blackSpans*: SpanFunc
    bitTest*: RasterBitTestFunc
    bitSet*: RasterBitSetFunc
    user*: pointer
    clipBox*: BBox

  RasterNewFunc* = proc (memory: pointer; raster: ptr Raster): cint {.cdecl.}
  RasterDoneFunc* = proc (raster: Raster) {.cdecl.}
  RasterResetFunc* = proc (raster: Raster; poolBase: ptr cuchar; 
                           poolSize: culong) {.cdecl.}
  RasterSetModeFunc* = proc (raster: Raster; mode: culong; args: pointer): cint {.
      cdecl.}
  RasterRenderFunc* = proc (raster: Raster; params: ptr RasterParams): cint {.
      cdecl.}
  RasterFuncs* = object 
    glyphFormat*: clong
    rasterNew*: RasterNewFunc
    rasterReset*: RasterResetFunc
    rasterSetMode*: RasterSetModeFunc
    rasterRender*: RasterRenderFunc
    rasterDone*: RasterDoneFunc

  UnitVector* = object 
    x*: cshort
    y*: cshort

  Matrix* = object 
    xx*: clong
    xy*: clong
    yx*: clong
    yy*: clong

  Data* = object 
    pointer*: ptr cuchar
    length*: cint

  ListNode* = ptr ListNodeRec
  List* = ptr ListRec
  ListNodeRec* = object 
    prev*: ListNode
    next*: ListNode
    data*: pointer

  ListRec* = object 
    head*: ListNode
    tail*: ListNode

  GlyphMetrics* = object 
    width*: clong
    height*: clong
    horiBearingX*: clong
    horiBearingY*: clong
    horiAdvance*: clong
    vertBearingX*: clong
    vertBearingY*: clong
    vertAdvance*: clong

  SubGlyph* = pointer
  SlotInternal* = pointer
  Parameter* = object 
    tag*: culong
    data*: pointer

  OpenArgs* = object 
    flags*: cuint
    memoryBase*: ptr cuchar
    memorySize*: clong
    pathname*: cstring
    stream*: Stream
    driver*: Module
    numParams*: cint
    params*: ptr Parameter

  SizeRequestType* {.size: sizeof(cint).} = enum 
    SIZE_REQUEST_TYPE_NOMINAL, SIZE_REQUEST_TYPE_REAL_DIM, 
    SIZE_REQUEST_TYPE_BBOX, SIZE_REQUEST_TYPE_CELL, SIZE_REQUEST_TYPE_SCALES, 
    SIZE_REQUEST_TYPE_MAX
  SizeRequestRec* = object 
    typ*: SizeRequestType
    width*: clong
    height*: clong
    horiResolution*: cuint
    vertResolution*: cuint

  SizeRequest* = ptr SizeRequestRec
  Angle* = clong












proc getKerning*(face: Face; leftGlyph: cuint; rightGlyph: cuint; 
                 kernMode: cuint; akerning: ptr Vector): cint {.cdecl, 
    importc: "FT_Get_Kerning", dynlib: libname.}
proc getTrackKerning*(face: Face; pointSize: clong; degree: cint; 
                      akerning: ptr clong): cint {.cdecl, 
    importc: "FT_Get_Track_Kerning", dynlib: libname.}
proc getGlyphName*(face: Face; glyphIndex: cuint; buffer: pointer; 
                   bufferMax: cuint): cint {.cdecl, 
    importc: "FT_Get_Glyph_Name", dynlib: libname.}
proc getPostscriptName*(face: Face): cstring {.cdecl, 
    importc: "FT_Get_Postscript_Name", dynlib: libname.}
proc selectCharmap*(face: Face; encoding: cint): cint {.cdecl, 
    importc: "FT_Select_Charmap", dynlib: libname.}
proc setCharmap*(face: Face; charmap: CharMap): cint {.cdecl, 
    importc: "FT_Set_Charmap", dynlib: libname.}
proc getCharmapIndex*(charmap: CharMap): cint {.cdecl, 
    importc: "FT_Get_Charmap_Index", dynlib: libname.}
proc getCharIndex*(face: Face; charcode: culong): cuint {.cdecl, 
    importc: "FT_Get_Char_Index", dynlib: libname.}
proc getFirstChar*(face: Face; agindex: ptr cuint): culong {.cdecl, 
    importc: "FT_Get_First_Char", dynlib: libname.}
proc getNextChar*(face: Face; charCode: culong; agindex: ptr cuint): culong {.
    cdecl, importc: "FT_Get_Next_Char", dynlib: libname.}
proc getNameIndex*(face: Face; glyphName: cstring): cuint {.cdecl, 
    importc: "FT_Get_Name_Index", dynlib: libname.}
proc initFreeType*(alibrary: ptr Library): cint {.cdecl, 
    importc: "FT_Init_FreeType", dynlib: libname.}
proc doneFreeType*(library: Library): cint {.cdecl, importc: "FT_Done_FreeType", 
    dynlib: libname.}
proc newFace*(library: Library; filepathname: cstring; faceIndex: clong; 
              aface: ptr Face): cint {.cdecl, importc: "FT_New_Face", 
                                       dynlib: libname.}
proc newMemoryFace*(library: Library; fileBase: ptr cuchar; fileSize: clong; 
                    faceIndex: clong; aface: ptr Face): cint {.cdecl, 
    importc: "FT_New_Memory_Face", dynlib: libname.}
proc openFace*(library: Library; args: ptr OpenArgs; faceIndex: clong; 
               aface: ptr Face): cint {.cdecl, importc: "FT_Open_Face", 
                                        dynlib: libname.}
proc attachFile*(face: Face; filepathname: cstring): cint {.cdecl, 
    importc: "FT_Attach_File", dynlib: libname.}
proc attachStream*(face: Face; parameters: ptr OpenArgs): cint {.cdecl, 
    importc: "FT_Attach_Stream", dynlib: libname.}
proc referenceFace*(face: Face): cint {.cdecl, importc: "FT_Reference_Face", 
                                        dynlib: libname.}
proc doneFace*(face: Face): cint {.cdecl, importc: "FT_Done_Face", 
                                   dynlib: libname.}
proc selectSize*(face: Face; strikeIndex: cint): cint {.cdecl, 
    importc: "FT_Select_Size", dynlib: libname.}
proc requestSize*(face: Face; req: SizeRequest): cint {.cdecl, 
    importc: "FT_Request_Size", dynlib: libname.}
proc setCharSize*(face: Face; charWidth: clong; charHeight: clong; 
                  horzResolution: cuint; vertResolution: cuint): cint {.cdecl, 
    importc: "FT_Set_Char_Size", dynlib: libname.}
proc setPixelSizes*(face: Face; pixelWidth: cuint; pixelHeight: cuint): cint {.
    cdecl, importc: "FT_Set_Pixel_Sizes", dynlib: libname.}
proc loadGlyph*(face: Face; glyphIndex: cuint; loadFlags: int32): cint {.cdecl, 
    importc: "FT_Load_Glyph", dynlib: libname.}
proc loadChar*(face: Face; charCode: culong; loadFlags: int32): cint {.cdecl, 
    importc: "FT_Load_Char", dynlib: libname.}
proc setTransform*(face: Face; matrix: ptr Matrix; delta: ptr Vector) {.cdecl, 
    importc: "FT_Set_Transform", dynlib: libname.}
proc renderGlyph*(slot: GlyphSlot; renderMode: cint): cint {.cdecl, 
    importc: "FT_Render_Glyph", dynlib: libname.}
proc getSubGlyphInfo*(glyph: GlyphSlot; subIndex: cuint; pIndex: ptr cint; 
                      pFlags: ptr cuint; pArg1: ptr cint; pArg2: ptr cint; 
                      pTransform: ptr Matrix): cint {.cdecl, 
    importc: "FT_Get_SubGlyph_Info", dynlib: libname.}
proc getFSTypeFlags*(face: Face): cushort {.cdecl, 
    importc: "FT_Get_FSType_Flags", dynlib: libname.}
proc faceGetCharVariantIndex*(face: Face; charcode: culong; 
                              variantSelector: culong): cuint {.cdecl, 
    importc: "FT_Face_GetCharVariantIndex", dynlib: libname.}
proc faceGetCharVariantIsDefault*(face: Face; charcode: culong; 
                                  variantSelector: culong): cint {.cdecl, 
    importc: "FT_Face_GetCharVariantIsDefault", dynlib: libname.}
proc faceGetVariantSelectors*(face: Face): ptr uint32 {.cdecl, 
    importc: "FT_Face_GetVariantSelectors", dynlib: libname.}
proc faceGetVariantsOfChar*(face: Face; charcode: culong): ptr uint32 {.cdecl, 
    importc: "FT_Face_GetVariantsOfChar", dynlib: libname.}
proc faceGetCharsOfVariant*(face: Face; variantSelector: culong): ptr uint32 {.
    cdecl, importc: "FT_Face_GetCharsOfVariant", dynlib: libname.}
proc mulDiv*(a: clong; b: clong; c: clong): clong {.cdecl, importc: "FT_MulDiv", 
    dynlib: libname.}
proc divFix*(a: clong; b: clong): clong {.cdecl, importc: "FT_DivFix", 
    dynlib: libname.}
proc roundFix*(a: clong): clong {.cdecl, importc: "FT_RoundFix", dynlib: libname.}
proc ceilFix*(a: clong): clong {.cdecl, importc: "FT_CeilFix", dynlib: libname.}
proc floorFix*(a: clong): clong {.cdecl, importc: "FT_FloorFix", dynlib: libname.}
proc vectorTransform*(vec: ptr Vector; matrix: ptr Matrix) {.cdecl, 
    importc: "FT_Vector_Transform", dynlib: libname.}
proc libraryVersion*(library: Library; amajor: ptr cint; aminor: ptr cint; 
                     apatch: ptr cint) {.cdecl, importc: "FT_Library_Version", 
    dynlib: libname.}
proc faceCheckTrueTypePatents*(face: Face): cuchar {.cdecl, 
    importc: "FT_Face_CheckTrueTypePatents", dynlib: libname.}
proc faceSetUnpatentedHinting*(face: Face; value: cuchar): cuchar {.cdecl, 
    importc: "FT_Face_SetUnpatentedHinting", dynlib: libname.}
proc sin*(angle: Angle): clong {.cdecl, importc: "FT_Sin", dynlib: libname.}
proc cos*(angle: Angle): clong {.cdecl, importc: "FT_Cos", dynlib: libname.}
proc tan*(angle: Angle): clong {.cdecl, importc: "FT_Tan", dynlib: libname.}
proc atan2*(x: clong; y: clong): Angle {.cdecl, importc: "FT_Atan2", 
    dynlib: libname.}
proc angleDiff*(angle1: Angle; angle2: Angle): Angle {.cdecl, 
    importc: "FT_Angle_Diff", dynlib: libname.}
proc vectorUnit*(vec: ptr Vector; angle: Angle) {.cdecl, 
    importc: "FT_Vector_Unit", dynlib: libname.}
proc vectorRotate*(vec: ptr Vector; angle: Angle) {.cdecl, 
    importc: "FT_Vector_Rotate", dynlib: libname.}
proc vectorLength*(vec: ptr Vector): clong {.cdecl, importc: "FT_Vector_Length", 
    dynlib: libname.}
proc vectorPolarize*(vec: ptr Vector; length: ptr clong; angle: ptr Angle) {.
    cdecl, importc: "FT_Vector_Polarize", dynlib: libname.}
proc vectorFromPolar*(vec: ptr Vector; length: clong; angle: Angle) {.cdecl, 
    importc: "FT_Vector_From_Polar", dynlib: libname.}
proc getSfntTable*(face: Face; tag: SfntTag): pointer {.cdecl, 
    importc: "FT_Get_Sfnt_Table", dynlib: libname.}
proc loadSfntTable*(face: Face; tag: culong; offset: clong; buffer: ptr cuchar; 
                    length: ptr culong): cint {.cdecl, 
    importc: "FT_Load_Sfnt_Table", dynlib: libname.}
proc sfntTableInfo*(face: Face; tableIndex: cuint; tag: ptr culong; 
                    length: ptr culong): cint {.cdecl, 
    importc: "FT_Sfnt_Table_Info", dynlib: libname.}
proc getCMapLanguageID*(charmap: CharMap): culong {.cdecl, 
    importc: "FT_Get_CMap_Language_ID", dynlib: libname.}
proc getCMapFormat*(charmap: CharMap): clong {.cdecl, 
    importc: "FT_Get_CMap_Format", dynlib: libname.}
proc getRenderer*(library: Library; format: clong): Renderer {.cdecl, 
    importc: "FT_Get_Renderer", dynlib: libname.}
proc setRenderer*(library: Library; renderer: Renderer; numParams: cuint; 
                  parameters: ptr Parameter): cint {.cdecl, 
    importc: "FT_Set_Renderer", dynlib: libname.}
proc streamOpenLZW*(stream: Stream; source: Stream): cint {.cdecl, 
    importc: "FT_Stream_OpenLZW", dynlib: libname.}
proc librarySetLcdFilter*(library: Library; filter: LcdFilter): cint {.cdecl, 
    importc: "FT_Library_SetLcdFilter", dynlib: libname.}
proc librarySetLcdFilterWeights*(library: Library; weights: ptr cuchar): cint {.
    cdecl, importc: "FT_Library_SetLcdFilterWeights", dynlib: libname.}
proc fTC_ManagerNew*(library: Library; maxFaces: cuint; maxSizes: cuint; 
                     maxBytes: culong; requester: FTC_FaceRequester; 
                     reqData: pointer; amanager: ptr FTC_Manager): cint {.cdecl, 
    importc: "FTC_Manager_New", dynlib: libname.}
proc fTC_ManagerReset*(manager: FTC_Manager) {.cdecl, 
    importc: "FTC_Manager_Reset", dynlib: libname.}
proc fTC_ManagerDone*(manager: FTC_Manager) {.cdecl, 
    importc: "FTC_Manager_Done", dynlib: libname.}
proc fTC_ManagerLookupFace*(manager: FTC_Manager; faceId: FTC_FaceID; 
                            aface: ptr Face): cint {.cdecl, 
    importc: "FTC_Manager_LookupFace", dynlib: libname.}
proc bitmapNew*(abitmap: ptr Bitmap) {.cdecl, importc: "FT_Bitmap_New", 
                                       dynlib: libname.}
proc bitmapCopy*(library: Library; source: ptr Bitmap; target: ptr Bitmap): cint {.
    cdecl, importc: "FT_Bitmap_Copy", dynlib: libname.}
proc bitmapEmbolden*(library: Library; bitmap: ptr Bitmap; xStrength: clong; 
                     yStrength: clong): cint {.cdecl, 
    importc: "FT_Bitmap_Embolden", dynlib: libname.}
proc bitmapConvert*(library: Library; source: ptr Bitmap; target: ptr Bitmap; 
                    alignment: cint): cint {.cdecl, 
    importc: "FT_Bitmap_Convert", dynlib: libname.}
proc glyphSlotOwnBitmap*(slot: GlyphSlot): cint {.cdecl, 
    importc: "FT_GlyphSlot_Own_Bitmap", dynlib: libname.}
proc bitmapDone*(library: Library; bitmap: ptr Bitmap): cint {.cdecl, 
    importc: "FT_Bitmap_Done", dynlib: libname.}
proc getBDF_CharsetID*(face: Face; acharsetEncoding: cstringArray; 
                       acharsetRegistry: cstringArray): cint {.cdecl, 
    importc: "FT_Get_BDF_Charset_ID", dynlib: libname.}
proc getBDF_Property*(face: Face; propName: cstring; aproperty: ptr PropertyRec): cint {.
    cdecl, importc: "FT_Get_BDF_Property", dynlib: libname.}
proc getAdvance*(face: Face; gindex: cuint; loadFlags: int32; 
                 padvance: ptr clong): cint {.cdecl, importc: "FT_Get_Advance", 
    dynlib: libname.}
proc getAdvances*(face: Face; start: cuint; count: cuint; loadFlags: int32; 
                  padvances: ptr clong): cint {.cdecl, 
    importc: "FT_Get_Advances", dynlib: libname.}
proc outlineGetBBox*(outline: ptr Outline; abbox: ptr BBox): cint {.cdecl, 
    importc: "FT_Outline_Get_BBox", dynlib: libname.}
proc getCID_RegistryOrderingSupplement*(face: Face; registry: cstringArray; 
                                        ordering: cstringArray; 
                                        supplement: ptr cint): cint {.cdecl, 
    importc: "FT_Get_CID_Registry_Ordering_Supplement", dynlib: libname.}
proc getCID_IsInternallyCID_Keyed*(face: Face; isCid: ptr cuchar): cint {.cdecl, 
    importc: "FT_Get_CID_Is_Internally_CID_Keyed", dynlib: libname.}
proc getCID_FromGlyphIndex*(face: Face; glyphIndex: cuint; cid: ptr cuint): cint {.
    cdecl, importc: "FT_Get_CID_From_Glyph_Index", dynlib: libname.}
proc getGasp*(face: Face; ppem: cuint): cint {.cdecl, importc: "FT_Get_Gasp", 
    dynlib: libname.}
proc glyphGetCBox*(glyph: Glyph; bboxMode: cuint; acbox: ptr BBox) {.cdecl, 
    importc: "FT_Glyph_Get_CBox", dynlib: libname.}
proc glyphToBitmap*(theGlyph: ptr Glyph; renderMode: cint; origin: ptr Vector; 
                    destroy: cuchar): cint {.cdecl, 
    importc: "FT_Glyph_To_Bitmap", dynlib: libname.}
proc doneGlyph*(glyph: Glyph) {.cdecl, importc: "FT_Done_Glyph", dynlib: libname.}
proc matrixMultiply*(a: ptr Matrix; b: ptr Matrix) {.cdecl, 
    importc: "FT_Matrix_Multiply", dynlib: libname.}
proc matrixInvert*(matrix: ptr Matrix): cint {.cdecl, 
    importc: "FT_Matrix_Invert", dynlib: libname.}
proc trueTypeGX_Validate*(face: Face; validationFlags: cuint; 
                          tables: array[(9 + 1), Bytes]; tableLength: cuint): cint {.
    cdecl, importc: "FT_TrueTypeGX_Validate", dynlib: libname.}
proc trueTypeGX_Free*(face: Face; table: Bytes) {.cdecl, 
    importc: "FT_TrueTypeGX_Free", dynlib: libname.}
proc classicKernValidate*(face: Face; validationFlags: cuint; 
                          ckernTable: ptr Bytes): cint {.cdecl, 
    importc: "FT_ClassicKern_Validate", dynlib: libname.}
proc classicKernFree*(face: Face; table: Bytes) {.cdecl, 
    importc: "FT_ClassicKern_Free", dynlib: libname.}
proc streamOpenBzip2*(stream: Stream; source: Stream): cint {.cdecl, 
    importc: "FT_Stream_OpenBzip2", dynlib: libname.}
proc streamOpenGzip*(stream: Stream; source: Stream): cint {.cdecl, 
    importc: "FT_Stream_OpenGzip", dynlib: libname.}
proc gzipUncompress*(memory: Memory; output: ptr cuchar; outputLen: ptr culong; 
                     input: ptr cuchar; inputLen: culong): cint {.cdecl, 
    importc: "FT_Gzip_Uncompress", dynlib: libname.}
proc fTC_ManagerLookupSize*(manager: FTC_Manager; scaler: FTC_Scaler; 
                            asize: ptr Size): cint {.cdecl, 
    importc: "FTC_Manager_LookupSize", dynlib: libname.}
proc fTC_NodeUnref*(node: FTC_Node; manager: FTC_Manager) {.cdecl, 
    importc: "FTC_Node_Unref", dynlib: libname.}
proc fTC_ManagerRemoveFaceID*(manager: FTC_Manager; faceId: FTC_FaceID) {.cdecl, 
    importc: "FTC_Manager_RemoveFaceID", dynlib: libname.}
proc fTC_CMapCacheNew*(manager: FTC_Manager; acache: ptr FTC_CMapCache): cint {.
    cdecl, importc: "FTC_CMapCache_New", dynlib: libname.}
proc fTC_CMapCacheLookup*(cache: FTC_CMapCache; faceId: FTC_FaceID; 
                          cmapIndex: cint; charCode: uint32): cuint {.cdecl, 
    importc: "FTC_CMapCache_Lookup", dynlib: libname.}
proc fTC_ImageCacheNew*(manager: FTC_Manager; acache: ptr FTC_ImageCache): cint {.
    cdecl, importc: "FTC_ImageCache_New", dynlib: libname.}
proc fTC_ImageCacheLookup*(cache: FTC_ImageCache; typ: FTC_ImageType; 
                           gindex: cuint; aglyph: ptr Glyph; anode: ptr FTC_Node): cint {.
    cdecl, importc: "FTC_ImageCache_Lookup", dynlib: libname.}
proc fTC_ImageCacheLookupScaler*(cache: FTC_ImageCache; scaler: FTC_Scaler; 
                                 loadFlags: culong; gindex: cuint; 
                                 aglyph: ptr Glyph; anode: ptr FTC_Node): cint {.
    cdecl, importc: "FTC_ImageCache_LookupScaler", dynlib: libname.}
proc fTC_SBitCacheNew*(manager: FTC_Manager; acache: ptr FTC_SBitCache): cint {.
    cdecl, importc: "FTC_SBitCache_New", dynlib: libname.}
proc fTC_SBitCacheLookup*(cache: FTC_SBitCache; typ: FTC_ImageType; 
                          gindex: cuint; sbit: ptr FTC_SBit; anode: ptr FTC_Node): cint {.
    cdecl, importc: "FTC_SBitCache_Lookup", dynlib: libname.}
proc fTC_SBitCacheLookupScaler*(cache: FTC_SBitCache; scaler: FTC_Scaler; 
                                loadFlags: culong; gindex: cuint; 
                                sbit: ptr FTC_SBit; anode: ptr FTC_Node): cint {.
    cdecl, importc: "FTC_SBitCache_LookupScaler", dynlib: libname.}
proc listFind*(list: List; data: pointer): ListNode {.cdecl, 
    importc: "FT_List_Find", dynlib: libname.}
proc listAdd*(list: List; node: ListNode) {.cdecl, importc: "FT_List_Add", 
    dynlib: libname.}
proc listInsert*(list: List; node: ListNode) {.cdecl, importc: "FT_List_Insert", 
    dynlib: libname.}
proc listRemove*(list: List; node: ListNode) {.cdecl, importc: "FT_List_Remove", 
    dynlib: libname.}
proc listUp*(list: List; node: ListNode) {.cdecl, importc: "FT_List_Up", 
    dynlib: libname.}
proc listIterate*(list: List; iter: ListIterator; user: pointer): cint {.cdecl, 
    importc: "FT_List_Iterate", dynlib: libname.}
proc listFinalize*(list: List; destroy: ListDestructor; memory: Memory; 
                   user: pointer) {.cdecl, importc: "FT_List_Finalize", 
                                    dynlib: libname.}
proc hasPS_GlyphNames*(face: Face): cint {.cdecl, 
    importc: "FT_Has_PS_Glyph_Names", dynlib: libname.}
proc getPS_FontInfo*(face: Face; afontInfo: FontInfo): cint {.cdecl, 
    importc: "FT_Get_PS_Font_Info", dynlib: libname.}
proc getPS_FontPrivate*(face: Face; afontPrivate: Private): cint {.cdecl, 
    importc: "FT_Get_PS_Font_Private", dynlib: libname.}
proc getPS_FontValue*(face: Face; key: DictKeys; idx: cuint; value: pointer; 
                      valueLen: clong): clong {.cdecl, 
    importc: "FT_Get_PS_Font_Value", dynlib: libname.}
proc getMultiMaster*(face: Face; amaster: ptr MultiMaster): cint {.cdecl, 
    importc: "FT_Get_Multi_Master", dynlib: libname.}
proc getMM_Var*(face: Face; amaster: ptr ptr MM_Var): cint {.cdecl, 
    importc: "FT_Get_MM_Var", dynlib: libname.}
proc setMM_DesignCoordinates*(face: Face; numCoords: cuint; coords: ptr clong): cint {.
    cdecl, importc: "FT_Set_MM_Design_Coordinates", dynlib: libname.}
proc setVarDesignCoordinates*(face: Face; numCoords: cuint; coords: ptr clong): cint {.
    cdecl, importc: "FT_Set_Var_Design_Coordinates", dynlib: libname.}
proc setMM_BlendCoordinates*(face: Face; numCoords: cuint; coords: ptr clong): cint {.
    cdecl, importc: "FT_Set_MM_Blend_Coordinates", dynlib: libname.}
proc setVarBlendCoordinates*(face: Face; numCoords: cuint; coords: ptr clong): cint {.
    cdecl, importc: "FT_Set_Var_Blend_Coordinates", dynlib: libname.}
proc openTypeValidate*(face: Face; validationFlags: cuint; 
                       bASE_table: ptr Bytes; gDEF_table: ptr Bytes; 
                       gPOS_table: ptr Bytes; gSUB_table: ptr Bytes; 
                       jSTF_table: ptr Bytes): cint {.cdecl, 
    importc: "FT_OpenType_Validate", dynlib: libname.}
proc openTypeFree*(face: Face; table: Bytes) {.cdecl, 
    importc: "FT_OpenType_Free", dynlib: libname.}
proc addModule*(library: Library; clazz: ptr ModuleClass): cint {.cdecl, 
    importc: "FT_Add_Module", dynlib: libname.}
proc getModule*(library: Library; moduleName: cstring): Module {.cdecl, 
    importc: "FT_Get_Module", dynlib: libname.}
proc removeModule*(library: Library; module: Module): cint {.cdecl, 
    importc: "FT_Remove_Module", dynlib: libname.}
proc propertySet*(library: Library; moduleName: cstring; propertyName: cstring; 
                  value: pointer): cint {.cdecl, importc: "FT_Property_Set", 
    dynlib: libname.}
proc propertyGet*(library: Library; moduleName: cstring; propertyName: cstring; 
                  value: pointer): cint {.cdecl, importc: "FT_Property_Get", 
    dynlib: libname.}
proc referenceLibrary*(library: Library): cint {.cdecl, 
    importc: "FT_Reference_Library", dynlib: libname.}
proc newLibrary*(memory: Memory; alibrary: ptr Library): cint {.cdecl, 
    importc: "FT_New_Library", dynlib: libname.}
proc doneLibrary*(library: Library): cint {.cdecl, importc: "FT_Done_Library", 
    dynlib: libname.}
proc setDebugHook*(library: Library; hookIndex: cuint; debugHook: DebugHookFunc) {.
    cdecl, importc: "FT_Set_Debug_Hook", dynlib: libname.}
proc addDefaultModules*(library: Library) {.cdecl, 
    importc: "FT_Add_Default_Modules", dynlib: libname.}
proc getTrueTypeEngineType*(library: Library): TrueTypeEngineType {.cdecl, 
    importc: "FT_Get_TrueType_Engine_Type", dynlib: libname.}
proc outlineDecompose*(outline: ptr Outline; funcInterface: ptr OutlineFuncs; 
                       user: pointer): cint {.cdecl, 
    importc: "FT_Outline_Decompose", dynlib: libname.}
proc outlineNew*(library: Library; numPoints: cuint; numContours: cint; 
                 anoutline: ptr Outline): cint {.cdecl, 
    importc: "FT_Outline_New", dynlib: libname.}
proc outlineNewInternal*(memory: Memory; numPoints: cuint; numContours: cint; 
                         anoutline: ptr Outline): cint {.cdecl, 
    importc: "FT_Outline_New_Internal", dynlib: libname.}
proc outlineDone*(library: Library; outline: ptr Outline): cint {.cdecl, 
    importc: "FT_Outline_Done", dynlib: libname.}
proc outlineDoneInternal*(memory: Memory; outline: ptr Outline): cint {.cdecl, 
    importc: "FT_Outline_Done_Internal", dynlib: libname.}
proc outlineCheck*(outline: ptr Outline): cint {.cdecl, 
    importc: "FT_Outline_Check", dynlib: libname.}
proc outlineGetCBox*(outline: ptr Outline; acbox: ptr BBox) {.cdecl, 
    importc: "FT_Outline_Get_CBox", dynlib: libname.}
proc outlineTranslate*(outline: ptr Outline; xOffset: clong; yOffset: clong) {.
    cdecl, importc: "FT_Outline_Translate", dynlib: libname.}
proc outlineCopy*(source: ptr Outline; target: ptr Outline): cint {.cdecl, 
    importc: "FT_Outline_Copy", dynlib: libname.}
proc outlineTransform*(outline: ptr Outline; matrix: ptr Matrix) {.cdecl, 
    importc: "FT_Outline_Transform", dynlib: libname.}
proc outlineEmbolden*(outline: ptr Outline; strength: clong): cint {.cdecl, 
    importc: "FT_Outline_Embolden", dynlib: libname.}
proc outlineEmboldenXY*(outline: ptr Outline; xstrength: clong; ystrength: clong): cint {.
    cdecl, importc: "FT_Outline_EmboldenXY", dynlib: libname.}
proc outlineReverse*(outline: ptr Outline) {.cdecl, 
    importc: "FT_Outline_Reverse", dynlib: libname.}
proc outlineGetBitmap*(library: Library; outline: ptr Outline; 
                       abitmap: ptr Bitmap): cint {.cdecl, 
    importc: "FT_Outline_Get_Bitmap", dynlib: libname.}
proc outlineRender*(library: Library; outline: ptr Outline; 
                    params: ptr RasterParams): cint {.cdecl, 
    importc: "FT_Outline_Render", dynlib: libname.}
proc outlineGetOrientation*(outline: ptr Outline): cint {.cdecl, 
    importc: "FT_Outline_Get_Orientation", dynlib: libname.}
proc getPFR_Metrics*(face: Face; aoutlineResolution: ptr cuint; 
                     ametricsResolution: ptr cuint; ametricsXScale: ptr clong; 
                     ametricsYScale: ptr clong): cint {.cdecl, 
    importc: "FT_Get_PFR_Metrics", dynlib: libname.}
proc getPFR_Kerning*(face: Face; left: cuint; right: cuint; avector: ptr Vector): cint {.
    cdecl, importc: "FT_Get_PFR_Kerning", dynlib: libname.}
proc getPFR_Advance*(face: Face; gindex: cuint; aadvance: ptr clong): cint {.
    cdecl, importc: "FT_Get_PFR_Advance", dynlib: libname.}
proc newSize*(face: Face; size: ptr Size): cint {.cdecl, importc: "FT_New_Size", 
    dynlib: libname.}
proc doneSize*(size: Size): cint {.cdecl, importc: "FT_Done_Size", 
                                   dynlib: libname.}
proc activateSize*(size: Size): cint {.cdecl, importc: "FT_Activate_Size", 
                                       dynlib: libname.}
proc getSfntNameCount*(face: Face): cuint {.cdecl, 
    importc: "FT_Get_Sfnt_Name_Count", dynlib: libname.}
proc getSfntName*(face: Face; idx: cuint; aname: ptr SfntName): cint {.cdecl, 
    importc: "FT_Get_Sfnt_Name", dynlib: libname.}
proc getGlyph*(slot: GlyphSlot; aglyph: ptr Glyph): cint {.cdecl, 
    importc: "FT_Get_Glyph", dynlib: libname.}
proc glyphCopy*(source: Glyph; target: ptr Glyph): cint {.cdecl, 
    importc: "FT_Glyph_Copy", dynlib: libname.}
proc glyphTransform*(glyph: Glyph; matrix: ptr Matrix; delta: ptr Vector): cint {.
    cdecl, importc: "FT_Glyph_Transform", dynlib: libname.}
proc outlineGetInsideBorder*(outline: ptr Outline): StrokerBorder {.cdecl, 
    importc: "FT_Outline_GetInsideBorder", dynlib: libname.}
proc outlineGetOutsideBorder*(outline: ptr Outline): StrokerBorder {.cdecl, 
    importc: "FT_Outline_GetOutsideBorder", dynlib: libname.}
proc strokerNew*(library: Library; astroker: ptr Stroker): cint {.cdecl, 
    importc: "FT_Stroker_New", dynlib: libname.}
proc strokerSet*(stroker: Stroker; radius: clong; lineCap: StrokerLineCap; 
                 lineJoin: cint; miterLimit: clong) {.cdecl, 
    importc: "FT_Stroker_Set", dynlib: libname.}
proc strokerRewind*(stroker: Stroker) {.cdecl, importc: "FT_Stroker_Rewind", 
                                        dynlib: libname.}
proc strokerParseOutline*(stroker: Stroker; outline: ptr Outline; opened: cuchar): cint {.
    cdecl, importc: "FT_Stroker_ParseOutline", dynlib: libname.}
proc strokerBeginSubPath*(stroker: Stroker; to: ptr Vector; open: cuchar): cint {.
    cdecl, importc: "FT_Stroker_BeginSubPath", dynlib: libname.}
proc strokerEndSubPath*(stroker: Stroker): cint {.cdecl, 
    importc: "FT_Stroker_EndSubPath", dynlib: libname.}
proc strokerLineTo*(stroker: Stroker; to: ptr Vector): cint {.cdecl, 
    importc: "FT_Stroker_LineTo", dynlib: libname.}
proc strokerConicTo*(stroker: Stroker; control: ptr Vector; to: ptr Vector): cint {.
    cdecl, importc: "FT_Stroker_ConicTo", dynlib: libname.}
proc strokerCubicTo*(stroker: Stroker; control1: ptr Vector; 
                     control2: ptr Vector; to: ptr Vector): cint {.cdecl, 
    importc: "FT_Stroker_CubicTo", dynlib: libname.}
proc strokerGetBorderCounts*(stroker: Stroker; border: StrokerBorder; 
                             anumPoints: ptr cuint; anumContours: ptr cuint): cint {.
    cdecl, importc: "FT_Stroker_GetBorderCounts", dynlib: libname.}
proc strokerExportBorder*(stroker: Stroker; border: StrokerBorder; 
                          outline: ptr Outline) {.cdecl, 
    importc: "FT_Stroker_ExportBorder", dynlib: libname.}
proc strokerGetCounts*(stroker: Stroker; anumPoints: ptr cuint; 
                       anumContours: ptr cuint): cint {.cdecl, 
    importc: "FT_Stroker_GetCounts", dynlib: libname.}
proc strokerExport*(stroker: Stroker; outline: ptr Outline) {.cdecl, 
    importc: "FT_Stroker_Export", dynlib: libname.}
proc strokerDone*(stroker: Stroker) {.cdecl, importc: "FT_Stroker_Done", 
                                      dynlib: libname.}
proc glyphStroke*(pglyph: ptr Glyph; stroker: Stroker; destroy: cuchar): cint {.
    cdecl, importc: "FT_Glyph_Stroke", dynlib: libname.}
proc glyphStrokeBorder*(pglyph: ptr Glyph; stroker: Stroker; inside: cuchar; 
                        destroy: cuchar): cint {.cdecl, 
    importc: "FT_Glyph_StrokeBorder", dynlib: libname.}
proc getWinFNT_Header*(face: Face; aheader: ptr WinFNT_HeaderRec): cint {.cdecl, 
    importc: "FT_Get_WinFNT_Header", dynlib: libname.}
