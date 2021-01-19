" credit to https://github.com/arzg/vim-rust-syntax-ext
syntax region rsTypeParams matchgroup=rsDelimiter start='<' end='>' keepend contains=TOP

syntax match rsModule '\v(::)@<=[a-z][a-z0-9_]*'
syntax match rsModule '\v[a-z][a-z0-9_]*(::)@='

syntax match rsFieldAccess '\v(\.)@<=[a-z][a-z0-9_]*>(\()@!'

" Foreign items are always preceded by zero or more type names separated by ‘::’
" (think nested enum variants) and at least one module path. This module path is
" preceded by a word separator to prevent matching partially on type names (i.e.
" skipping the instal capital letter).
function! MatchForeign(regex, groupName, extraParams)
    execute 'syntax match ' . a:groupName . ' "\v(<[a-z][a-z0-9_]*::([A-Z][A-Za-z0-9]*::)*)@<=' . a:regex . '"' . a:extraParams
endfunction

" Crate-local items are also preceded by zero or more types names separated by
" ‘::’, which is then preceded by zero or more module names separated by ‘::’,
" which is finally preceded by ‘crate::’.
function! MatchCrateLocal(regex, groupName, extraParams)
    execute 'syntax match ' . a:groupName . ' "\v(crate::([a-z][a-z0-9_]*::)*([A-Z][A-Za-z0-9]*::)*)@<=' . a:regex . '"' . a:extraParams
endfunction

"
" Types
"

syntax match rsUserType '\v<[A-Z][A-Za-z0-9]*' nextgroup=rsTypeParams
call MatchForeign('[A-Z][A-Za-z0-9]*', 'rsForeignType', ' nextgroup=rsTypeParams')
call MatchCrateLocal('[A-Z][A-Za-z0-9]*', 'rsCrateType', ' nextgroup=rsTypeParams')


" Standard library types

let s:standardLibraryTypes = ["AccessError", "AcqRel", "Acquire", "Add", "AddAssign", "AddrInUse", "AddrNotAvailable", "AddrParseError", "AdminLocal", "Alignment", "Alloc", "AllocErr", "AllocError", "AlreadyExists", "Ancestors", "Any", "Arc", "Args", "ArgsOs", "Arguments", "AsMut", "AsRawFd", "AsRawHandle", "AsRawSocket", "AsRef", "AsciiExt", "AssertUnwindSafe", "AtomicBool", "AtomicI16", "AtomicI32", "AtomicI64", "AtomicI8", "AtomicIsize", "AtomicPtr", "AtomicU16", "AtomicU32", "AtomicU64", "AtomicU8", "AtomicUsize", "BTreeMap", "BTreeSet", "Backtrace", "BacktraceStatus", "Barrier", "BarrierWaitResult", "Binary", "BinaryHeap", "BitAnd", "BitAndAssign", "BitOr", "BitOrAssign", "BitXor", "BitXorAssign", "Borrow", "BorrowError", "BorrowMut", "BorrowMutError", "Borrowed", "Both", "Bound", "Box", "BrokenPipe", "BufRead", "BufReader", "BufWriter", "BuildHasher", "BuildHasherDefault", "Builder", "Bytes", "CStr", "CString", "CannotReallocInPlace", "CapacityOverflow", "Captured", "Cell", "Center", "Chain", "CharIndices", "CharPredicateSearcher", "CharSearcher", "CharSliceSearcher", "CharTryFromError", "Chars", "Child", "ChildStderr", "ChildStdin", "ChildStdout", "Chunks", "ChunksExact", "ChunksExactMut", "ChunksMut", "Clone", "Cloned", "CoerceUnsized", "Command", "CommandExt", "Complete", "Component", "Components", "Concat", "Condvar", "ConnectionAborted", "ConnectionRefused", "ConnectionReset", "Context", "Copied", "Copy", "Cow", "CurDir", "Current", "Cursor", "Cycle", "Debug", "DebugList", "DebugMap", "DebugSet", "DebugStruct", "DebugTuple", "DecodeUtf16", "DecodeUtf16Error", "Default", "DefaultHasher", "Deref", "DerefMut", "DeviceNS", "Difference", "DirBuilder", "DirBuilderExt", "DirEntry", "DirEntryExt", "Disabled", "Disconnected", "Discriminant", "Disk", "DispatchFromDyn", "Display", "Div", "DivAssign", "Done", "DoubleEndedIterator", "DoubleEndedSearcher", "Drain", "DrainFilter", "DrainSorted", "Drop", "Duration", "Empty", "EncodeUtf16", "EncodeWide", "End", "Entry", "Enumerate", "Eq", "Equal", "Err", "ErrorKind", "EscapeDebug", "EscapeDefault", "EscapeUnicode", "ExactSizeIterator", "Excess", "Excluded", "ExitCode", "ExitStatus", "ExitStatusExt", "Extend", "File", "FileExt", "FileType", "FileTypeExt", "Filter", "FilterMap", "FixedSizeArray", "FlatMap", "Flatten", "FloatToInt", "Fn", "FnMut", "FnOnce", "Formatter", "FpCategory", "From", "FromBytesWithNulError", "FromFn", "FromIterator", "FromRawFd", "FromRawHandle", "FromRawSocket", "FromStr", "FromUtf16Error", "FromUtf8Error", "Full", "Fuse", "FusedIterator", "Future", "Generator", "GeneratorState", "Global", "GlobalAlloc", "Greater", "HANDLE", "Hash", "HashMap", "HashSet", "Hasher", "Included", "Incoming", "Index", "IndexMut", "Infallible", "Infinite", "Initializer", "Inspect", "Instant", "IntErrorKind", "InterfaceLocal", "Interrupted", "Intersection", "Into", "IntoInnerError", "IntoIter", "IntoIterSorted", "IntoIterator", "IntoRawFd", "IntoRawHandle", "IntoRawSocket", "IntoStringError", "InvalidData", "InvalidDigit", "InvalidInput", "IoSlice", "IoSliceMut", "IpAddr", "Ipv4Addr", "Ipv6Addr", "Ipv6MulticastScope", "Iter", "IterMut", "Iterator", "Join", "JoinHandle", "JoinHandleExt", "JoinPathsError", "Keys", "Layout", "LayoutErr", "Left", "LengthAtMost32", "Less", "LineWriter", "Lines", "LinesAny", "LinkLocal", "LinkedList", "LocalKey", "Location", "LockResult", "LowerExp", "LowerHex", "ManuallyDrop", "Map", "Match", "MatchIndices", "Matches", "MaybeUninit", "Metadata", "MetadataExt", "Mul", "MulAssign", "Mutex", "MutexGuard", "Nan", "Neg", "NonNull", "NonZeroI128", "NonZeroI16", "NonZeroI32", "NonZeroI64", "NonZeroI8", "NonZeroIsize", "NonZeroU128", "NonZeroU16", "NonZeroU32", "NonZeroU64", "NonZeroU8", "NonZeroUsize", "None", "NoneError", "Normal", "Not", "NotConnected", "NotFound", "NotPresent", "NotUnicode", "NulError", "Occupied", "OccupiedEntry", "Octal", "Ok", "Once", "OnceState", "OnceWith", "OpenOptions", "OpenOptionsExt", "Option", "Ord", "Ordering", "OrganizationLocal", "OsStr", "OsStrExt", "OsString", "OsStringExt", "Other", "Output", "Overflow", "Owned", "PanicInfo", "ParentDir", "ParseBoolError", "ParseCharError", "ParseError", "ParseFloatError", "ParseIntError", "PartialEq", "PartialOrd", "Path", "PathBuf", "Pattern", "PeekMut", "Peekable", "Pending", "PermissionDenied", "Permissions", "PermissionsExt", "PhantomData", "PhantomPinned", "Pin", "Pointer", "PoisonError", "Poisoned", "Poll", "Prefix", "PrefixComponent", "Product", "RChunks", "RChunksExact", "RChunksExactMut", "RChunksMut", "RMatchIndices", "RMatches", "RSplit", "RSplitMut", "RSplitN", "RSplitNMut", "RSplitTerminator", "RandomState", "Range", "RangeBounds", "RangeFrom", "RangeFull", "RangeInclusive", "RangeMut", "RangeTo", "RangeToInclusive", "RawEntryBuilder", "RawEntryBuilderMut", "RawEntryMut", "RawFd", "RawHandle", "RawOccupiedEntryMut", "RawPthread", "RawSocket", "RawVacantEntryMut", "RawWaker", "RawWakerVTable", "Rc", "Read", "ReadDir", "Ready", "RealmLocal", "Receiver", "RecvError", "RecvTimeoutError", "Ref", "RefCell", "RefMut", "RefUnwindSafe", "Reject", "Relaxed", "Release", "Rem", "RemAssign", "Repeat", "RepeatWith", "Result", "Rev", "Reverse", "ReverseSearcher", "Right", "RootDir", "RwLock", "RwLockReadGuard", "RwLockWriteGuard", "SOCKET", "Scan", "SearchStep", "Searcher", "Seek", "SeekFrom", "Send", "SendError", "Sender", "SeqCst", "Shl", "ShlAssign", "Shr", "ShrAssign", "Shutdown", "Sink", "SipHasher", "SiteLocal", "Sized", "Skip", "SkipWhile", "SliceIndex", "SocketAddr", "SocketAddrV4", "SocketAddrV6", "Some", "Splice", "Split", "SplitAsciiWhitespace", "SplitMut", "SplitN", "SplitNMut", "SplitPaths", "SplitTerminator", "SplitWhitespace", "Start", "Stderr", "StderrLock", "Stdin", "StdinLock", "Stdio", "Stdout", "StdoutLock", "Step", "StepBy", "StrSearcher", "String", "StripPrefixError", "StructuralEq", "StructuralPartialEq", "Sub", "SubAssign", "Subnormal", "Successors", "Sum", "SymmetricDifference", "Sync", "SyncSender", "System", "SystemTime", "SystemTimeError", "Take", "TakeWhile", "TcpListener", "TcpStream", "Termination", "Thread", "ThreadId", "TimedOut", "Timeout", "ToLowercase", "ToOwned", "ToSocketAddrs", "ToString", "ToUppercase", "TraitObject", "TrustedLen", "Try", "TryFrom", "TryFromIntError", "TryFromSliceError", "TryInto", "TryIter", "TryLockError", "TryLockResult", "TryRecvError", "TryReserveError", "TrySendError", "TypeId", "UNC", "UdpSocket", "Unbounded", "Underflow", "UnexpectedEof", "UnicodeVersion", "Union", "UnixDatagram", "UnixListener", "UnixStream", "Unpin", "UnsafeCell", "Unsize", "Unsupported", "UnwindSafe", "UpperExp", "UpperHex", "Utf8Error", "V4", "V6", "VaList", "VaListImpl", "Vacant", "VacantEntry", "Values", "ValuesMut", "VarError", "Vars", "VarsOs", "Vec", "VecDeque", "Verbatim", "VerbatimDisk", "VerbatimUNC", "WaitTimeoutResult", "Waker", "Weak", "TokenStream", "Windows", "WouldBlock", "Wrapping", "Write", "WriteZero", "Yielded", "Zero", "Zip", "blkcnt_t", "blksize_t", "bool", "c_char", "c_double", "c_float", "c_int", "c_long", "c_longlong", "c_schar", "c_short", "c_uchar", "c_uint", "c_ulong", "c_ulonglong", "c_ushort", "char", "dev_t", "f32", "f64", "gid_t", "i128", "i16", "i32", "i64", "i8", "ino_t", "isize", "mode_t", "nlink_t", "off_t", "pid_t", "pthread_t", "str", "time_t", "u128", "u16", "u32", "u64", "u8", "uid_t", "usize"]

for s:standardLibraryType in s:standardLibraryTypes
    execute 'syntax keyword rsLibraryType ' . s:standardLibraryType . ' nextgroup=rsTypeParams'
endfor

"
" Constants
"

syntax match rsUserConst '\v<[A-Z][A-Z0-9_]+>'
call MatchForeign('[A-Z][A-Z0-9_]+>', 'rsForeignConst', '')
call MatchCrateLocal('[A-Z][A-Z0-9_]+>', 'rsCrateConst', '')

"
" Functions
"

syntax match rsUserFunc '\v[a-z][a-z0-9_]*(\()@='

call MatchForeign('[a-z][a-z0-9_]*(\()@=', 'rsForeignFunc', '')
call MatchCrateLocal('[a-z][a-z0-9_]*(\()@=', 'rsCrateFunc', '')

syntax match rsUserMethod '\v(\.)@<=[a-z][a-z0-9_]*(\(|::)@='
highlight default link rsUserMethod rsUserFunc

syntax match rsDelimiter '[(){}\[\]|\.,;]\+'

" syn match MyAngleBrace '[<>]'
syntax match rsOperator '[!%&/\*+<=>?\^-]\+'

" We highlight mutable references separately as an operator because otherwise
" they would be recognised as the ‘mut’ keyword, thus whatever comes after the
" ‘mut’ is highlighted as an identifier definition.
syntax match rsOperator '&mut'
syntax keyword rsUserType usize

" syn match MyParens /[\[\]\(\)\{\}\.]/
" syn match MySemicolons /;/
" syn match MyDoubleColons /::/
" syn keyword rustKeyword as
"
"
"
" Comments
"

syntax region rsComment start='//' end='$' contains=@Spell

syntax region rsBlockComment start='/\*' end='\*/' contains=@Spell
