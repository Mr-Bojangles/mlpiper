у╕
┬,Щ,
9
Add
x"T
y"T
z"T"
Ttype:
2	
А
ApplyGradientDescent
var"TА

alpha"T

delta"T
out"TА"
Ttype:
2	"
use_lockingbool( 
Ш
ArgMax

input"T
	dimension"Tidx
output"output_type"
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
x
Assign
ref"TА

value"T

output_ref"TА"	
Ttype"
validate_shapebool("
use_lockingbool(Ш
{
BiasAdd

value"T	
bias"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
{
BiasAddGrad
out_backprop"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
╚
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
ю
Conv2DBackpropFilter

input"T
filter_sizes
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
э
Conv2DBackpropInput
input_sizes
filter"T
out_backprop"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
A
Equal
x"T
y"T
z
"
Ttype:
2	
Р
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
4
Fill
dims

value"T
output"T"	
Ttype
:
Greater
x"T
y"T
z
"
Ttype:
2		
б
HashTableV2
table_handle"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetypeИ
.
Identity

input"T
output"T"	
Ttype
b
InitializeTableV2
table_handle
keys"Tkey
values"Tval"
Tkeytype"
TvaltypeИ
w
LookupTableFindV2
table_handle
keys"Tin
default_value"Tout
values"Tout"
Tintype"
TouttypeИ
o
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2
┼
MaxPool

input"T
output"T"
Ttype0:
2		"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW
ы
MaxPoolGrad

orig_input"T
orig_output"T	
grad"T
output"T"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW"
Ttype0:
2		
К
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(И
<
Mul
x"T
y"T
z"T"
Ttype:
2	Р
-
Neg
x"T
y"T"
Ttype:
	2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
я
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
}
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	И
`
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:
2	
=
RealDiv
x"T
y"T
z"T"
Ttype:
2	
A
Relu
features"T
activations"T"
Ttype:
2		
S
ReluGrad
	gradients"T
features"T
	backprops"T"
Ttype:
2		
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
i
SoftmaxCrossEntropyWithLogits
features"T
labels"T	
loss"T
backprop"T"
Ttype:
2
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
5
Sub
x"T
y"T
z"T"
Ttype:
	2	
Й
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
c
TopKV2

input"T
k
values"T
indices"
sortedbool("
Ttype:
2		
s

VariableV2
ref"dtypeА"
shapeshape"
dtypetype"
	containerstring "
shared_namestring И
&
	ZerosLike
x"T
y"T"	
Ttype"serve*1.3.02v1.3.0-rc2-20-g0787eeeы 
O

tf_examplePlaceholder*
dtype0*
shape:*
_output_shapes
:
U
ParseExample/ConstConst*
dtype0*
_output_shapes
: *
valueB 
b
ParseExample/ParseExample/namesConst*
dtype0*
_output_shapes
: *
valueB 
h
&ParseExample/ParseExample/dense_keys_0Const*
dtype0*
_output_shapes
: *
value	B Bx
Щ
ParseExample/ParseExampleParseExample
tf_exampleParseExample/ParseExample/names&ParseExample/ParseExample/dense_keys_0ParseExample/Const*
sparse_types
 *
Ndense*
Tdense
2*
Nsparse *
dense_shapes	
:Р*(
_output_shapes
:         Р
[
xIdentityParseExample/ParseExample*(
_output_shapes
:         Р*
T0
n
PlaceholderPlaceholder*
dtype0*
shape:         
*'
_output_shapes
:         

f
Reshape/shapeConst*
dtype0*
_output_shapes
:*%
valueB"             
l
ReshapeReshapexReshape/shape*
Tshape0*/
_output_shapes
:         *
T0
й
.conv2d/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:* 
_class
loc:@conv2d/kernel*%
valueB"             
У
,conv2d/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: * 
_class
loc:@conv2d/kernel*
valueB
 *nзо╜
У
,conv2d/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: * 
_class
loc:@conv2d/kernel*
valueB
 *nзо=
Ё
6conv2d/kernel/Initializer/random_uniform/RandomUniformRandomUniform.conv2d/kernel/Initializer/random_uniform/shape*
dtype0*
seed2 *

seed * 
_class
loc:@conv2d/kernel*
T0*&
_output_shapes
: 
╥
,conv2d/kernel/Initializer/random_uniform/subSub,conv2d/kernel/Initializer/random_uniform/max,conv2d/kernel/Initializer/random_uniform/min*
_output_shapes
: * 
_class
loc:@conv2d/kernel*
T0
ь
,conv2d/kernel/Initializer/random_uniform/mulMul6conv2d/kernel/Initializer/random_uniform/RandomUniform,conv2d/kernel/Initializer/random_uniform/sub*&
_output_shapes
: * 
_class
loc:@conv2d/kernel*
T0
▐
(conv2d/kernel/Initializer/random_uniformAdd,conv2d/kernel/Initializer/random_uniform/mul,conv2d/kernel/Initializer/random_uniform/min*&
_output_shapes
: * 
_class
loc:@conv2d/kernel*
T0
│
conv2d/kernel
VariableV2*
dtype0*
shape: *
	container * 
_class
loc:@conv2d/kernel*
shared_name *&
_output_shapes
: 
╙
conv2d/kernel/AssignAssignconv2d/kernel(conv2d/kernel/Initializer/random_uniform*
validate_shape(*&
_output_shapes
: *
use_locking(* 
_class
loc:@conv2d/kernel*
T0
А
conv2d/kernel/readIdentityconv2d/kernel*&
_output_shapes
: * 
_class
loc:@conv2d/kernel*
T0
К
conv2d/bias/Initializer/zerosConst*
dtype0*
_output_shapes
: *
_class
loc:@conv2d/bias*
valueB *    
Ч
conv2d/bias
VariableV2*
dtype0*
shape: *
	container *
_class
loc:@conv2d/bias*
shared_name *
_output_shapes
: 
╢
conv2d/bias/AssignAssignconv2d/biasconv2d/bias/Initializer/zeros*
validate_shape(*
_output_shapes
: *
use_locking(*
_class
loc:@conv2d/bias*
T0
n
conv2d/bias/readIdentityconv2d/bias*
_output_shapes
: *
_class
loc:@conv2d/bias*
T0
q
conv2d/convolution/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"             
q
 conv2d/convolution/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
╩
conv2d/convolutionConv2DReshapeconv2d/kernel/read*
data_formatNHWC*
strides
*
paddingSAME*/
_output_shapes
:          *
use_cudnn_on_gpu(*
T0
Р
conv2d/BiasAddBiasAddconv2d/convolutionconv2d/bias/read*/
_output_shapes
:          *
data_formatNHWC*
T0
]
conv2d/ReluReluconv2d/BiasAdd*/
_output_shapes
:          *
T0
║
max_pooling2d/MaxPoolMaxPoolconv2d/Relu*
ksize
*
data_formatNHWC*
strides
*
paddingVALID*/
_output_shapes
:          *
T0
н
0conv2d_1/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*"
_class
loc:@conv2d_1/kernel*%
valueB"          @   
Ч
.conv2d_1/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *"
_class
loc:@conv2d_1/kernel*
valueB
 *═╠L╜
Ч
.conv2d_1/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *"
_class
loc:@conv2d_1/kernel*
valueB
 *═╠L=
Ў
8conv2d_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform0conv2d_1/kernel/Initializer/random_uniform/shape*
dtype0*
seed2 *

seed *"
_class
loc:@conv2d_1/kernel*
T0*&
_output_shapes
: @
┌
.conv2d_1/kernel/Initializer/random_uniform/subSub.conv2d_1/kernel/Initializer/random_uniform/max.conv2d_1/kernel/Initializer/random_uniform/min*
_output_shapes
: *"
_class
loc:@conv2d_1/kernel*
T0
Ї
.conv2d_1/kernel/Initializer/random_uniform/mulMul8conv2d_1/kernel/Initializer/random_uniform/RandomUniform.conv2d_1/kernel/Initializer/random_uniform/sub*&
_output_shapes
: @*"
_class
loc:@conv2d_1/kernel*
T0
ц
*conv2d_1/kernel/Initializer/random_uniformAdd.conv2d_1/kernel/Initializer/random_uniform/mul.conv2d_1/kernel/Initializer/random_uniform/min*&
_output_shapes
: @*"
_class
loc:@conv2d_1/kernel*
T0
╖
conv2d_1/kernel
VariableV2*
dtype0*
shape: @*
	container *"
_class
loc:@conv2d_1/kernel*
shared_name *&
_output_shapes
: @
█
conv2d_1/kernel/AssignAssignconv2d_1/kernel*conv2d_1/kernel/Initializer/random_uniform*
validate_shape(*&
_output_shapes
: @*
use_locking(*"
_class
loc:@conv2d_1/kernel*
T0
Ж
conv2d_1/kernel/readIdentityconv2d_1/kernel*&
_output_shapes
: @*"
_class
loc:@conv2d_1/kernel*
T0
О
conv2d_1/bias/Initializer/zerosConst*
dtype0*
_output_shapes
:@* 
_class
loc:@conv2d_1/bias*
valueB@*    
Ы
conv2d_1/bias
VariableV2*
dtype0*
shape:@*
	container * 
_class
loc:@conv2d_1/bias*
shared_name *
_output_shapes
:@
╛
conv2d_1/bias/AssignAssignconv2d_1/biasconv2d_1/bias/Initializer/zeros*
validate_shape(*
_output_shapes
:@*
use_locking(* 
_class
loc:@conv2d_1/bias*
T0
t
conv2d_1/bias/readIdentityconv2d_1/bias*
_output_shapes
:@* 
_class
loc:@conv2d_1/bias*
T0
s
conv2d_2/convolution/ShapeConst*
dtype0*
_output_shapes
:*%
valueB"          @   
s
"conv2d_2/convolution/dilation_rateConst*
dtype0*
_output_shapes
:*
valueB"      
▄
conv2d_2/convolutionConv2Dmax_pooling2d/MaxPoolconv2d_1/kernel/read*
data_formatNHWC*
strides
*
paddingSAME*/
_output_shapes
:         @*
use_cudnn_on_gpu(*
T0
Ц
conv2d_2/BiasAddBiasAddconv2d_2/convolutionconv2d_1/bias/read*/
_output_shapes
:         @*
data_formatNHWC*
T0
a
conv2d_2/ReluReluconv2d_2/BiasAdd*/
_output_shapes
:         @*
T0
╛
max_pooling2d_2/MaxPoolMaxPoolconv2d_2/Relu*
ksize
*
data_formatNHWC*
strides
*
paddingVALID*/
_output_shapes
:         @*
T0
`
Reshape_1/shapeConst*
dtype0*
_output_shapes
:*
valueB"    @  

	Reshape_1Reshapemax_pooling2d_2/MaxPoolReshape_1/shape*
Tshape0*(
_output_shapes
:         └*
T0
Я
-dense/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
_class
loc:@dense/kernel*
valueB"@     
С
+dense/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
_class
loc:@dense/kernel*
valueB
 *ИО╜
С
+dense/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
_class
loc:@dense/kernel*
valueB
 *ИО=
ч
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
dtype0*
seed2 *

seed *
_class
loc:@dense/kernel*
T0* 
_output_shapes
:
└А
╬
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
_output_shapes
: *
_class
loc:@dense/kernel*
T0
т
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub* 
_output_shapes
:
└А*
_class
loc:@dense/kernel*
T0
╘
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min* 
_output_shapes
:
└А*
_class
loc:@dense/kernel*
T0
е
dense/kernel
VariableV2*
dtype0*
shape:
└А*
	container *
_class
loc:@dense/kernel*
shared_name * 
_output_shapes
:
└А
╔
dense/kernel/AssignAssigndense/kernel'dense/kernel/Initializer/random_uniform*
validate_shape(* 
_output_shapes
:
└А*
use_locking(*
_class
loc:@dense/kernel*
T0
w
dense/kernel/readIdentitydense/kernel* 
_output_shapes
:
└А*
_class
loc:@dense/kernel*
T0
К
dense/bias/Initializer/zerosConst*
dtype0*
_output_shapes	
:А*
_class
loc:@dense/bias*
valueBА*    
Ч

dense/bias
VariableV2*
dtype0*
shape:А*
	container *
_class
loc:@dense/bias*
shared_name *
_output_shapes	
:А
│
dense/bias/AssignAssign
dense/biasdense/bias/Initializer/zeros*
validate_shape(*
_output_shapes	
:А*
use_locking(*
_class
loc:@dense/bias*
T0
l
dense/bias/readIdentity
dense/bias*
_output_shapes	
:А*
_class
loc:@dense/bias*
T0
Н
dense/MatMulMatMul	Reshape_1dense/kernel/read*(
_output_shapes
:         А*
transpose_a( *
transpose_b( *
T0
Б
dense/BiasAddBiasAdddense/MatMuldense/bias/read*(
_output_shapes
:         А*
data_formatNHWC*
T0
T

dense/ReluReludense/BiasAdd*(
_output_shapes
:         А*
T0
г
/dense_1/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*!
_class
loc:@dense_1/kernel*
valueB"   
   
Х
-dense_1/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *!
_class
loc:@dense_1/kernel*
valueB
 *шЬ╜
Х
-dense_1/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *!
_class
loc:@dense_1/kernel*
valueB
 *шЬ=
ь
7dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_1/kernel/Initializer/random_uniform/shape*
dtype0*
seed2 *

seed *!
_class
loc:@dense_1/kernel*
T0*
_output_shapes
:	А

╓
-dense_1/kernel/Initializer/random_uniform/subSub-dense_1/kernel/Initializer/random_uniform/max-dense_1/kernel/Initializer/random_uniform/min*
_output_shapes
: *!
_class
loc:@dense_1/kernel*
T0
щ
-dense_1/kernel/Initializer/random_uniform/mulMul7dense_1/kernel/Initializer/random_uniform/RandomUniform-dense_1/kernel/Initializer/random_uniform/sub*
_output_shapes
:	А
*!
_class
loc:@dense_1/kernel*
T0
█
)dense_1/kernel/Initializer/random_uniformAdd-dense_1/kernel/Initializer/random_uniform/mul-dense_1/kernel/Initializer/random_uniform/min*
_output_shapes
:	А
*!
_class
loc:@dense_1/kernel*
T0
з
dense_1/kernel
VariableV2*
dtype0*
shape:	А
*
	container *!
_class
loc:@dense_1/kernel*
shared_name *
_output_shapes
:	А

╨
dense_1/kernel/AssignAssigndense_1/kernel)dense_1/kernel/Initializer/random_uniform*
validate_shape(*
_output_shapes
:	А
*
use_locking(*!
_class
loc:@dense_1/kernel*
T0
|
dense_1/kernel/readIdentitydense_1/kernel*
_output_shapes
:	А
*!
_class
loc:@dense_1/kernel*
T0
М
dense_1/bias/Initializer/zerosConst*
dtype0*
_output_shapes
:
*
_class
loc:@dense_1/bias*
valueB
*    
Щ
dense_1/bias
VariableV2*
dtype0*
shape:
*
	container *
_class
loc:@dense_1/bias*
shared_name *
_output_shapes
:

║
dense_1/bias/AssignAssigndense_1/biasdense_1/bias/Initializer/zeros*
validate_shape(*
_output_shapes
:
*
use_locking(*
_class
loc:@dense_1/bias*
T0
q
dense_1/bias/readIdentitydense_1/bias*
_output_shapes
:
*
_class
loc:@dense_1/bias*
T0
С
dense_2/MatMulMatMul
dense/Reludense_1/kernel/read*'
_output_shapes
:         
*
transpose_a( *
transpose_b( *
T0
Ж
dense_2/BiasAddBiasAdddense_2/MatMuldense_1/bias/read*'
_output_shapes
:         
*
data_formatNHWC*
T0
P
yIdentitydense_2/BiasAdd*'
_output_shapes
:         
*
T0
a
softmax_cross_entropy_loss/RankConst*
dtype0*
_output_shapes
: *
value	B :
a
 softmax_cross_entropy_loss/ShapeShapey*
out_type0*
_output_shapes
:*
T0
c
!softmax_cross_entropy_loss/Rank_1Const*
dtype0*
_output_shapes
: *
value	B :
c
"softmax_cross_entropy_loss/Shape_1Shapey*
out_type0*
_output_shapes
:*
T0
b
 softmax_cross_entropy_loss/Sub/yConst*
dtype0*
_output_shapes
: *
value	B :
Л
softmax_cross_entropy_loss/SubSub!softmax_cross_entropy_loss/Rank_1 softmax_cross_entropy_loss/Sub/y*
_output_shapes
: *
T0
И
&softmax_cross_entropy_loss/Slice/beginPacksoftmax_cross_entropy_loss/Sub*

axis *
_output_shapes
:*
N*
T0
o
%softmax_cross_entropy_loss/Slice/sizeConst*
dtype0*
_output_shapes
:*
valueB:
╬
 softmax_cross_entropy_loss/SliceSlice"softmax_cross_entropy_loss/Shape_1&softmax_cross_entropy_loss/Slice/begin%softmax_cross_entropy_loss/Slice/size*
_output_shapes
:*
Index0*
T0
}
*softmax_cross_entropy_loss/concat/values_0Const*
dtype0*
_output_shapes
:*
valueB:
         
h
&softmax_cross_entropy_loss/concat/axisConst*
dtype0*
_output_shapes
: *
value	B : 
▌
!softmax_cross_entropy_loss/concatConcatV2*softmax_cross_entropy_loss/concat/values_0 softmax_cross_entropy_loss/Slice&softmax_cross_entropy_loss/concat/axis*

Tidx0*
_output_shapes
:*
N*
T0
Ь
"softmax_cross_entropy_loss/ReshapeReshapey!softmax_cross_entropy_loss/concat*
Tshape0*0
_output_shapes
:                  *
T0
c
!softmax_cross_entropy_loss/Rank_2Const*
dtype0*
_output_shapes
: *
value	B :
m
"softmax_cross_entropy_loss/Shape_2ShapePlaceholder*
out_type0*
_output_shapes
:*
T0
d
"softmax_cross_entropy_loss/Sub_1/yConst*
dtype0*
_output_shapes
: *
value	B :
П
 softmax_cross_entropy_loss/Sub_1Sub!softmax_cross_entropy_loss/Rank_2"softmax_cross_entropy_loss/Sub_1/y*
_output_shapes
: *
T0
М
(softmax_cross_entropy_loss/Slice_1/beginPack softmax_cross_entropy_loss/Sub_1*

axis *
_output_shapes
:*
N*
T0
q
'softmax_cross_entropy_loss/Slice_1/sizeConst*
dtype0*
_output_shapes
:*
valueB:
╘
"softmax_cross_entropy_loss/Slice_1Slice"softmax_cross_entropy_loss/Shape_2(softmax_cross_entropy_loss/Slice_1/begin'softmax_cross_entropy_loss/Slice_1/size*
_output_shapes
:*
Index0*
T0

,softmax_cross_entropy_loss/concat_1/values_0Const*
dtype0*
_output_shapes
:*
valueB:
         
j
(softmax_cross_entropy_loss/concat_1/axisConst*
dtype0*
_output_shapes
: *
value	B : 
х
#softmax_cross_entropy_loss/concat_1ConcatV2,softmax_cross_entropy_loss/concat_1/values_0"softmax_cross_entropy_loss/Slice_1(softmax_cross_entropy_loss/concat_1/axis*

Tidx0*
_output_shapes
:*
N*
T0
к
$softmax_cross_entropy_loss/Reshape_1ReshapePlaceholder#softmax_cross_entropy_loss/concat_1*
Tshape0*0
_output_shapes
:                  *
T0
╪
#softmax_cross_entropy_loss/xentropySoftmaxCrossEntropyWithLogits"softmax_cross_entropy_loss/Reshape$softmax_cross_entropy_loss/Reshape_1*?
_output_shapes-
+:         :                  *
T0
d
"softmax_cross_entropy_loss/Sub_2/yConst*
dtype0*
_output_shapes
: *
value	B :
Н
 softmax_cross_entropy_loss/Sub_2Subsoftmax_cross_entropy_loss/Rank"softmax_cross_entropy_loss/Sub_2/y*
_output_shapes
: *
T0
r
(softmax_cross_entropy_loss/Slice_2/beginConst*
dtype0*
_output_shapes
:*
valueB: 
Л
'softmax_cross_entropy_loss/Slice_2/sizePack softmax_cross_entropy_loss/Sub_2*

axis *
_output_shapes
:*
N*
T0
█
"softmax_cross_entropy_loss/Slice_2Slice softmax_cross_entropy_loss/Shape(softmax_cross_entropy_loss/Slice_2/begin'softmax_cross_entropy_loss/Slice_2/size*#
_output_shapes
:         *
Index0*
T0
┤
$softmax_cross_entropy_loss/Reshape_2Reshape#softmax_cross_entropy_loss/xentropy"softmax_cross_entropy_loss/Slice_2*
Tshape0*#
_output_shapes
:         *
T0
|
7softmax_cross_entropy_loss/assert_broadcastable/weightsConst*
dtype0*
_output_shapes
: *
valueB
 *  А?
А
=softmax_cross_entropy_loss/assert_broadcastable/weights/shapeConst*
dtype0*
_output_shapes
: *
valueB 
~
<softmax_cross_entropy_loss/assert_broadcastable/weights/rankConst*
dtype0*
_output_shapes
: *
value	B : 
а
<softmax_cross_entropy_loss/assert_broadcastable/values/shapeShape$softmax_cross_entropy_loss/Reshape_2*
out_type0*
_output_shapes
:*
T0
}
;softmax_cross_entropy_loss/assert_broadcastable/values/rankConst*
dtype0*
_output_shapes
: *
value	B :
S
Ksoftmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_successNoOp
╣
&softmax_cross_entropy_loss/ToFloat_1/xConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *  А?
б
softmax_cross_entropy_loss/MulMul$softmax_cross_entropy_loss/Reshape_2&softmax_cross_entropy_loss/ToFloat_1/x*#
_output_shapes
:         *
T0
╕
 softmax_cross_entropy_loss/ConstConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
:*
valueB: 
е
softmax_cross_entropy_loss/SumSumsoftmax_cross_entropy_loss/Mul softmax_cross_entropy_loss/Const*

Tidx0*
_output_shapes
: *
	keep_dims( *
T0
┴
.softmax_cross_entropy_loss/num_present/Equal/yConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *    
о
,softmax_cross_entropy_loss/num_present/EqualEqual&softmax_cross_entropy_loss/ToFloat_1/x.softmax_cross_entropy_loss/num_present/Equal/y*
_output_shapes
: *
T0
─
1softmax_cross_entropy_loss/num_present/zeros_likeConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *    
╟
6softmax_cross_entropy_loss/num_present/ones_like/ShapeConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB 
╔
6softmax_cross_entropy_loss/num_present/ones_like/ConstConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *  А?
╔
0softmax_cross_entropy_loss/num_present/ones_likeFill6softmax_cross_entropy_loss/num_present/ones_like/Shape6softmax_cross_entropy_loss/num_present/ones_like/Const*
_output_shapes
: *
T0
ы
-softmax_cross_entropy_loss/num_present/SelectSelect,softmax_cross_entropy_loss/num_present/Equal1softmax_cross_entropy_loss/num_present/zeros_like0softmax_cross_entropy_loss/num_present/ones_like*
_output_shapes
: *
T0
ь
[softmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/weights/shapeConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB 
ъ
Zsoftmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/weights/rankConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
value	B : 
М
Zsoftmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/values/shapeShape$softmax_cross_entropy_loss/Reshape_2L^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
out_type0*
_output_shapes
:*
T0
щ
Ysoftmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/values/rankConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
value	B :
┐
isoftmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_successNoOpL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success
ц
Hsoftmax_cross_entropy_loss/num_present/broadcast_weights/ones_like/ShapeShape$softmax_cross_entropy_loss/Reshape_2L^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_successj^softmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success*
out_type0*
_output_shapes
:*
T0
╟
Hsoftmax_cross_entropy_loss/num_present/broadcast_weights/ones_like/ConstConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_successj^softmax_cross_entropy_loss/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *  А?
М
Bsoftmax_cross_entropy_loss/num_present/broadcast_weights/ones_likeFillHsoftmax_cross_entropy_loss/num_present/broadcast_weights/ones_like/ShapeHsoftmax_cross_entropy_loss/num_present/broadcast_weights/ones_like/Const*#
_output_shapes
:         *
T0
р
8softmax_cross_entropy_loss/num_present/broadcast_weightsMul-softmax_cross_entropy_loss/num_present/SelectBsoftmax_cross_entropy_loss/num_present/broadcast_weights/ones_like*#
_output_shapes
:         *
T0
─
,softmax_cross_entropy_loss/num_present/ConstConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
:*
valueB: 
╙
&softmax_cross_entropy_loss/num_presentSum8softmax_cross_entropy_loss/num_present/broadcast_weights,softmax_cross_entropy_loss/num_present/Const*

Tidx0*
_output_shapes
: *
	keep_dims( *
T0
│
"softmax_cross_entropy_loss/Const_1ConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB 
й
 softmax_cross_entropy_loss/Sum_1Sumsoftmax_cross_entropy_loss/Sum"softmax_cross_entropy_loss/Const_1*

Tidx0*
_output_shapes
: *
	keep_dims( *
T0
╖
$softmax_cross_entropy_loss/Greater/yConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *    
Ь
"softmax_cross_entropy_loss/GreaterGreater&softmax_cross_entropy_loss/num_present$softmax_cross_entropy_loss/Greater/y*
_output_shapes
: *
T0
╡
"softmax_cross_entropy_loss/Equal/yConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *    
Ц
 softmax_cross_entropy_loss/EqualEqual&softmax_cross_entropy_loss/num_present"softmax_cross_entropy_loss/Equal/y*
_output_shapes
: *
T0
╗
*softmax_cross_entropy_loss/ones_like/ShapeConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB 
╜
*softmax_cross_entropy_loss/ones_like/ConstConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *  А?
е
$softmax_cross_entropy_loss/ones_likeFill*softmax_cross_entropy_loss/ones_like/Shape*softmax_cross_entropy_loss/ones_like/Const*
_output_shapes
: *
T0
╝
!softmax_cross_entropy_loss/SelectSelect softmax_cross_entropy_loss/Equal$softmax_cross_entropy_loss/ones_like&softmax_cross_entropy_loss/num_present*
_output_shapes
: *
T0
П
softmax_cross_entropy_loss/divRealDiv softmax_cross_entropy_loss/Sum_1!softmax_cross_entropy_loss/Select*
_output_shapes
: *
T0
╕
%softmax_cross_entropy_loss/zeros_likeConstL^softmax_cross_entropy_loss/assert_broadcastable/static_scalar_check_success*
dtype0*
_output_shapes
: *
valueB
 *    
╢
 softmax_cross_entropy_loss/valueSelect"softmax_cross_entropy_loss/Greatersoftmax_cross_entropy_loss/div%softmax_cross_entropy_loss/zeros_like*
_output_shapes
: *
T0
R
gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
T
gradients/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *  А?
Y
gradients/FillFillgradients/Shapegradients/Const*
_output_shapes
: *
T0

:gradients/softmax_cross_entropy_loss/value_grad/zeros_likeConst*
dtype0*
_output_shapes
: *
valueB
 *    
╤
6gradients/softmax_cross_entropy_loss/value_grad/SelectSelect"softmax_cross_entropy_loss/Greatergradients/Fill:gradients/softmax_cross_entropy_loss/value_grad/zeros_like*
_output_shapes
: *
T0
╙
8gradients/softmax_cross_entropy_loss/value_grad/Select_1Select"softmax_cross_entropy_loss/Greater:gradients/softmax_cross_entropy_loss/value_grad/zeros_likegradients/Fill*
_output_shapes
: *
T0
╝
@gradients/softmax_cross_entropy_loss/value_grad/tuple/group_depsNoOp7^gradients/softmax_cross_entropy_loss/value_grad/Select9^gradients/softmax_cross_entropy_loss/value_grad/Select_1
╗
Hgradients/softmax_cross_entropy_loss/value_grad/tuple/control_dependencyIdentity6gradients/softmax_cross_entropy_loss/value_grad/SelectA^gradients/softmax_cross_entropy_loss/value_grad/tuple/group_deps*
_output_shapes
: *I
_class?
=;loc:@gradients/softmax_cross_entropy_loss/value_grad/Select*
T0
┴
Jgradients/softmax_cross_entropy_loss/value_grad/tuple/control_dependency_1Identity8gradients/softmax_cross_entropy_loss/value_grad/Select_1A^gradients/softmax_cross_entropy_loss/value_grad/tuple/group_deps*
_output_shapes
: *K
_classA
?=loc:@gradients/softmax_cross_entropy_loss/value_grad/Select_1*
T0
v
3gradients/softmax_cross_entropy_loss/div_grad/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
x
5gradients/softmax_cross_entropy_loss/div_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
Е
Cgradients/softmax_cross_entropy_loss/div_grad/BroadcastGradientArgsBroadcastGradientArgs3gradients/softmax_cross_entropy_loss/div_grad/Shape5gradients/softmax_cross_entropy_loss/div_grad/Shape_1*2
_output_shapes 
:         :         *
T0
╬
5gradients/softmax_cross_entropy_loss/div_grad/RealDivRealDivHgradients/softmax_cross_entropy_loss/value_grad/tuple/control_dependency!softmax_cross_entropy_loss/Select*
_output_shapes
: *
T0
Ї
1gradients/softmax_cross_entropy_loss/div_grad/SumSum5gradients/softmax_cross_entropy_loss/div_grad/RealDivCgradients/softmax_cross_entropy_loss/div_grad/BroadcastGradientArgs*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
╫
5gradients/softmax_cross_entropy_loss/div_grad/ReshapeReshape1gradients/softmax_cross_entropy_loss/div_grad/Sum3gradients/softmax_cross_entropy_loss/div_grad/Shape*
Tshape0*
_output_shapes
: *
T0
{
1gradients/softmax_cross_entropy_loss/div_grad/NegNeg softmax_cross_entropy_loss/Sum_1*
_output_shapes
: *
T0
╣
7gradients/softmax_cross_entropy_loss/div_grad/RealDiv_1RealDiv1gradients/softmax_cross_entropy_loss/div_grad/Neg!softmax_cross_entropy_loss/Select*
_output_shapes
: *
T0
┐
7gradients/softmax_cross_entropy_loss/div_grad/RealDiv_2RealDiv7gradients/softmax_cross_entropy_loss/div_grad/RealDiv_1!softmax_cross_entropy_loss/Select*
_output_shapes
: *
T0
▄
1gradients/softmax_cross_entropy_loss/div_grad/mulMulHgradients/softmax_cross_entropy_loss/value_grad/tuple/control_dependency7gradients/softmax_cross_entropy_loss/div_grad/RealDiv_2*
_output_shapes
: *
T0
Ї
3gradients/softmax_cross_entropy_loss/div_grad/Sum_1Sum1gradients/softmax_cross_entropy_loss/div_grad/mulEgradients/softmax_cross_entropy_loss/div_grad/BroadcastGradientArgs:1*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
▌
7gradients/softmax_cross_entropy_loss/div_grad/Reshape_1Reshape3gradients/softmax_cross_entropy_loss/div_grad/Sum_15gradients/softmax_cross_entropy_loss/div_grad/Shape_1*
Tshape0*
_output_shapes
: *
T0
╕
>gradients/softmax_cross_entropy_loss/div_grad/tuple/group_depsNoOp6^gradients/softmax_cross_entropy_loss/div_grad/Reshape8^gradients/softmax_cross_entropy_loss/div_grad/Reshape_1
╡
Fgradients/softmax_cross_entropy_loss/div_grad/tuple/control_dependencyIdentity5gradients/softmax_cross_entropy_loss/div_grad/Reshape?^gradients/softmax_cross_entropy_loss/div_grad/tuple/group_deps*
_output_shapes
: *H
_class>
<:loc:@gradients/softmax_cross_entropy_loss/div_grad/Reshape*
T0
╗
Hgradients/softmax_cross_entropy_loss/div_grad/tuple/control_dependency_1Identity7gradients/softmax_cross_entropy_loss/div_grad/Reshape_1?^gradients/softmax_cross_entropy_loss/div_grad/tuple/group_deps*
_output_shapes
: *J
_class@
><loc:@gradients/softmax_cross_entropy_loss/div_grad/Reshape_1*
T0
А
=gradients/softmax_cross_entropy_loss/Sum_1_grad/Reshape/shapeConst*
dtype0*
_output_shapes
: *
valueB 
°
7gradients/softmax_cross_entropy_loss/Sum_1_grad/ReshapeReshapeFgradients/softmax_cross_entropy_loss/div_grad/tuple/control_dependency=gradients/softmax_cross_entropy_loss/Sum_1_grad/Reshape/shape*
Tshape0*
_output_shapes
: *
T0
Б
>gradients/softmax_cross_entropy_loss/Sum_1_grad/Tile/multiplesConst*
dtype0*
_output_shapes
: *
valueB 
ш
4gradients/softmax_cross_entropy_loss/Sum_1_grad/TileTile7gradients/softmax_cross_entropy_loss/Sum_1_grad/Reshape>gradients/softmax_cross_entropy_loss/Sum_1_grad/Tile/multiples*
_output_shapes
: *

Tmultiples0*
T0
А
;gradients/softmax_cross_entropy_loss/Select_grad/zeros_likeConst*
dtype0*
_output_shapes
: *
valueB
 *    
Л
7gradients/softmax_cross_entropy_loss/Select_grad/SelectSelect softmax_cross_entropy_loss/EqualHgradients/softmax_cross_entropy_loss/div_grad/tuple/control_dependency_1;gradients/softmax_cross_entropy_loss/Select_grad/zeros_like*
_output_shapes
: *
T0
Н
9gradients/softmax_cross_entropy_loss/Select_grad/Select_1Select softmax_cross_entropy_loss/Equal;gradients/softmax_cross_entropy_loss/Select_grad/zeros_likeHgradients/softmax_cross_entropy_loss/div_grad/tuple/control_dependency_1*
_output_shapes
: *
T0
┐
Agradients/softmax_cross_entropy_loss/Select_grad/tuple/group_depsNoOp8^gradients/softmax_cross_entropy_loss/Select_grad/Select:^gradients/softmax_cross_entropy_loss/Select_grad/Select_1
┐
Igradients/softmax_cross_entropy_loss/Select_grad/tuple/control_dependencyIdentity7gradients/softmax_cross_entropy_loss/Select_grad/SelectB^gradients/softmax_cross_entropy_loss/Select_grad/tuple/group_deps*
_output_shapes
: *J
_class@
><loc:@gradients/softmax_cross_entropy_loss/Select_grad/Select*
T0
┼
Kgradients/softmax_cross_entropy_loss/Select_grad/tuple/control_dependency_1Identity9gradients/softmax_cross_entropy_loss/Select_grad/Select_1B^gradients/softmax_cross_entropy_loss/Select_grad/tuple/group_deps*
_output_shapes
: *L
_classB
@>loc:@gradients/softmax_cross_entropy_loss/Select_grad/Select_1*
T0
Е
;gradients/softmax_cross_entropy_loss/Sum_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
ц
5gradients/softmax_cross_entropy_loss/Sum_grad/ReshapeReshape4gradients/softmax_cross_entropy_loss/Sum_1_grad/Tile;gradients/softmax_cross_entropy_loss/Sum_grad/Reshape/shape*
Tshape0*
_output_shapes
:*
T0
С
3gradients/softmax_cross_entropy_loss/Sum_grad/ShapeShapesoftmax_cross_entropy_loss/Mul*
out_type0*
_output_shapes
:*
T0
ц
2gradients/softmax_cross_entropy_loss/Sum_grad/TileTile5gradients/softmax_cross_entropy_loss/Sum_grad/Reshape3gradients/softmax_cross_entropy_loss/Sum_grad/Shape*#
_output_shapes
:         *

Tmultiples0*
T0
Ч
3gradients/softmax_cross_entropy_loss/Mul_grad/ShapeShape$softmax_cross_entropy_loss/Reshape_2*
out_type0*
_output_shapes
:*
T0
x
5gradients/softmax_cross_entropy_loss/Mul_grad/Shape_1Const*
dtype0*
_output_shapes
: *
valueB 
Е
Cgradients/softmax_cross_entropy_loss/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs3gradients/softmax_cross_entropy_loss/Mul_grad/Shape5gradients/softmax_cross_entropy_loss/Mul_grad/Shape_1*2
_output_shapes 
:         :         *
T0
┬
1gradients/softmax_cross_entropy_loss/Mul_grad/mulMul2gradients/softmax_cross_entropy_loss/Sum_grad/Tile&softmax_cross_entropy_loss/ToFloat_1/x*#
_output_shapes
:         *
T0
Ё
1gradients/softmax_cross_entropy_loss/Mul_grad/SumSum1gradients/softmax_cross_entropy_loss/Mul_grad/mulCgradients/softmax_cross_entropy_loss/Mul_grad/BroadcastGradientArgs*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
ф
5gradients/softmax_cross_entropy_loss/Mul_grad/ReshapeReshape1gradients/softmax_cross_entropy_loss/Mul_grad/Sum3gradients/softmax_cross_entropy_loss/Mul_grad/Shape*
Tshape0*#
_output_shapes
:         *
T0
┬
3gradients/softmax_cross_entropy_loss/Mul_grad/mul_1Mul$softmax_cross_entropy_loss/Reshape_22gradients/softmax_cross_entropy_loss/Sum_grad/Tile*#
_output_shapes
:         *
T0
Ў
3gradients/softmax_cross_entropy_loss/Mul_grad/Sum_1Sum3gradients/softmax_cross_entropy_loss/Mul_grad/mul_1Egradients/softmax_cross_entropy_loss/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
▌
7gradients/softmax_cross_entropy_loss/Mul_grad/Reshape_1Reshape3gradients/softmax_cross_entropy_loss/Mul_grad/Sum_15gradients/softmax_cross_entropy_loss/Mul_grad/Shape_1*
Tshape0*
_output_shapes
: *
T0
╕
>gradients/softmax_cross_entropy_loss/Mul_grad/tuple/group_depsNoOp6^gradients/softmax_cross_entropy_loss/Mul_grad/Reshape8^gradients/softmax_cross_entropy_loss/Mul_grad/Reshape_1
┬
Fgradients/softmax_cross_entropy_loss/Mul_grad/tuple/control_dependencyIdentity5gradients/softmax_cross_entropy_loss/Mul_grad/Reshape?^gradients/softmax_cross_entropy_loss/Mul_grad/tuple/group_deps*#
_output_shapes
:         *H
_class>
<:loc:@gradients/softmax_cross_entropy_loss/Mul_grad/Reshape*
T0
╗
Hgradients/softmax_cross_entropy_loss/Mul_grad/tuple/control_dependency_1Identity7gradients/softmax_cross_entropy_loss/Mul_grad/Reshape_1?^gradients/softmax_cross_entropy_loss/Mul_grad/tuple/group_deps*
_output_shapes
: *J
_class@
><loc:@gradients/softmax_cross_entropy_loss/Mul_grad/Reshape_1*
T0
Н
Cgradients/softmax_cross_entropy_loss/num_present_grad/Reshape/shapeConst*
dtype0*
_output_shapes
:*
valueB:
Н
=gradients/softmax_cross_entropy_loss/num_present_grad/ReshapeReshapeKgradients/softmax_cross_entropy_loss/Select_grad/tuple/control_dependency_1Cgradients/softmax_cross_entropy_loss/num_present_grad/Reshape/shape*
Tshape0*
_output_shapes
:*
T0
│
;gradients/softmax_cross_entropy_loss/num_present_grad/ShapeShape8softmax_cross_entropy_loss/num_present/broadcast_weights*
out_type0*
_output_shapes
:*
T0
■
:gradients/softmax_cross_entropy_loss/num_present_grad/TileTile=gradients/softmax_cross_entropy_loss/num_present_grad/Reshape;gradients/softmax_cross_entropy_loss/num_present_grad/Shape*#
_output_shapes
:         *

Tmultiples0*
T0
Р
Mgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/ShapeConst*
dtype0*
_output_shapes
: *
valueB 
╤
Ogradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Shape_1ShapeBsoftmax_cross_entropy_loss/num_present/broadcast_weights/ones_like*
out_type0*
_output_shapes
:*
T0
╙
]gradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/BroadcastGradientArgsBroadcastGradientArgsMgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/ShapeOgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Shape_1*2
_output_shapes 
:         :         *
T0
А
Kgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/mulMul:gradients/softmax_cross_entropy_loss/num_present_grad/TileBsoftmax_cross_entropy_loss/num_present/broadcast_weights/ones_like*#
_output_shapes
:         *
T0
╛
Kgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/SumSumKgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/mul]gradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/BroadcastGradientArgs*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
е
Ogradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/ReshapeReshapeKgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/SumMgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Shape*
Tshape0*
_output_shapes
: *
T0
э
Mgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/mul_1Mul-softmax_cross_entropy_loss/num_present/Select:gradients/softmax_cross_entropy_loss/num_present_grad/Tile*#
_output_shapes
:         *
T0
─
Mgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Sum_1SumMgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/mul_1_gradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/BroadcastGradientArgs:1*

Tidx0*
_output_shapes
:*
	keep_dims( *
T0
╕
Qgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape_1ReshapeMgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Sum_1Ogradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Shape_1*
Tshape0*#
_output_shapes
:         *
T0
Ж
Xgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/tuple/group_depsNoOpP^gradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/ReshapeR^gradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape_1
Э
`gradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/tuple/control_dependencyIdentityOgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/ReshapeY^gradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/tuple/group_deps*
_output_shapes
: *b
_classX
VTloc:@gradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape*
T0
░
bgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/tuple/control_dependency_1IdentityQgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape_1Y^gradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/tuple/group_deps*#
_output_shapes
:         *d
_classZ
XVloc:@gradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/Reshape_1*
T0
б
Wgradients/softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like_grad/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
╫
Ugradients/softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like_grad/SumSumbgradients/softmax_cross_entropy_loss/num_present/broadcast_weights_grad/tuple/control_dependency_1Wgradients/softmax_cross_entropy_loss/num_present/broadcast_weights/ones_like_grad/Const*

Tidx0*
_output_shapes
: *
	keep_dims( *
T0
Ь
9gradients/softmax_cross_entropy_loss/Reshape_2_grad/ShapeShape#softmax_cross_entropy_loss/xentropy*
out_type0*
_output_shapes
:*
T0
Е
;gradients/softmax_cross_entropy_loss/Reshape_2_grad/ReshapeReshapeFgradients/softmax_cross_entropy_loss/Mul_grad/tuple/control_dependency9gradients/softmax_cross_entropy_loss/Reshape_2_grad/Shape*
Tshape0*#
_output_shapes
:         *
T0
Г
gradients/zeros_like	ZerosLike%softmax_cross_entropy_loss/xentropy:1*0
_output_shapes
:                  *
T0
М
Agradients/softmax_cross_entropy_loss/xentropy_grad/ExpandDims/dimConst*
dtype0*
_output_shapes
: *
valueB :
         
Й
=gradients/softmax_cross_entropy_loss/xentropy_grad/ExpandDims
ExpandDims;gradients/softmax_cross_entropy_loss/Reshape_2_grad/ReshapeAgradients/softmax_cross_entropy_loss/xentropy_grad/ExpandDims/dim*'
_output_shapes
:         *
T0*

Tdim0
▐
6gradients/softmax_cross_entropy_loss/xentropy_grad/mulMul=gradients/softmax_cross_entropy_loss/xentropy_grad/ExpandDims%softmax_cross_entropy_loss/xentropy:1*0
_output_shapes
:                  *
T0
x
7gradients/softmax_cross_entropy_loss/Reshape_grad/ShapeShapey*
out_type0*
_output_shapes
:*
T0
ї
9gradients/softmax_cross_entropy_loss/Reshape_grad/ReshapeReshape6gradients/softmax_cross_entropy_loss/xentropy_grad/mul7gradients/softmax_cross_entropy_loss/Reshape_grad/Shape*
Tshape0*'
_output_shapes
:         
*
T0
░
*gradients/dense_2/BiasAdd_grad/BiasAddGradBiasAddGrad9gradients/softmax_cross_entropy_loss/Reshape_grad/Reshape*
_output_shapes
:
*
data_formatNHWC*
T0
а
/gradients/dense_2/BiasAdd_grad/tuple/group_depsNoOp:^gradients/softmax_cross_entropy_loss/Reshape_grad/Reshape+^gradients/dense_2/BiasAdd_grad/BiasAddGrad
░
7gradients/dense_2/BiasAdd_grad/tuple/control_dependencyIdentity9gradients/softmax_cross_entropy_loss/Reshape_grad/Reshape0^gradients/dense_2/BiasAdd_grad/tuple/group_deps*'
_output_shapes
:         
*L
_classB
@>loc:@gradients/softmax_cross_entropy_loss/Reshape_grad/Reshape*
T0
З
9gradients/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity*gradients/dense_2/BiasAdd_grad/BiasAddGrad0^gradients/dense_2/BiasAdd_grad/tuple/group_deps*
_output_shapes
:
*=
_class3
1/loc:@gradients/dense_2/BiasAdd_grad/BiasAddGrad*
T0
╒
$gradients/dense_2/MatMul_grad/MatMulMatMul7gradients/dense_2/BiasAdd_grad/tuple/control_dependencydense_1/kernel/read*(
_output_shapes
:         А*
transpose_a( *
transpose_b(*
T0
┼
&gradients/dense_2/MatMul_grad/MatMul_1MatMul
dense/Relu7gradients/dense_2/BiasAdd_grad/tuple/control_dependency*
_output_shapes
:	А
*
transpose_a(*
transpose_b( *
T0
Ж
.gradients/dense_2/MatMul_grad/tuple/group_depsNoOp%^gradients/dense_2/MatMul_grad/MatMul'^gradients/dense_2/MatMul_grad/MatMul_1
Е
6gradients/dense_2/MatMul_grad/tuple/control_dependencyIdentity$gradients/dense_2/MatMul_grad/MatMul/^gradients/dense_2/MatMul_grad/tuple/group_deps*(
_output_shapes
:         А*7
_class-
+)loc:@gradients/dense_2/MatMul_grad/MatMul*
T0
В
8gradients/dense_2/MatMul_grad/tuple/control_dependency_1Identity&gradients/dense_2/MatMul_grad/MatMul_1/^gradients/dense_2/MatMul_grad/tuple/group_deps*
_output_shapes
:	А
*9
_class/
-+loc:@gradients/dense_2/MatMul_grad/MatMul_1*
T0
е
"gradients/dense/Relu_grad/ReluGradReluGrad6gradients/dense_2/MatMul_grad/tuple/control_dependency
dense/Relu*(
_output_shapes
:         А*
T0
Ш
(gradients/dense/BiasAdd_grad/BiasAddGradBiasAddGrad"gradients/dense/Relu_grad/ReluGrad*
_output_shapes	
:А*
data_formatNHWC*
T0
Е
-gradients/dense/BiasAdd_grad/tuple/group_depsNoOp#^gradients/dense/Relu_grad/ReluGrad)^gradients/dense/BiasAdd_grad/BiasAddGrad
 
5gradients/dense/BiasAdd_grad/tuple/control_dependencyIdentity"gradients/dense/Relu_grad/ReluGrad.^gradients/dense/BiasAdd_grad/tuple/group_deps*(
_output_shapes
:         А*5
_class+
)'loc:@gradients/dense/Relu_grad/ReluGrad*
T0
А
7gradients/dense/BiasAdd_grad/tuple/control_dependency_1Identity(gradients/dense/BiasAdd_grad/BiasAddGrad.^gradients/dense/BiasAdd_grad/tuple/group_deps*
_output_shapes	
:А*;
_class1
/-loc:@gradients/dense/BiasAdd_grad/BiasAddGrad*
T0
╧
"gradients/dense/MatMul_grad/MatMulMatMul5gradients/dense/BiasAdd_grad/tuple/control_dependencydense/kernel/read*(
_output_shapes
:         └*
transpose_a( *
transpose_b(*
T0
┴
$gradients/dense/MatMul_grad/MatMul_1MatMul	Reshape_15gradients/dense/BiasAdd_grad/tuple/control_dependency* 
_output_shapes
:
└А*
transpose_a(*
transpose_b( *
T0
А
,gradients/dense/MatMul_grad/tuple/group_depsNoOp#^gradients/dense/MatMul_grad/MatMul%^gradients/dense/MatMul_grad/MatMul_1
¤
4gradients/dense/MatMul_grad/tuple/control_dependencyIdentity"gradients/dense/MatMul_grad/MatMul-^gradients/dense/MatMul_grad/tuple/group_deps*(
_output_shapes
:         └*5
_class+
)'loc:@gradients/dense/MatMul_grad/MatMul*
T0
√
6gradients/dense/MatMul_grad/tuple/control_dependency_1Identity$gradients/dense/MatMul_grad/MatMul_1-^gradients/dense/MatMul_grad/tuple/group_deps* 
_output_shapes
:
└А*7
_class-
+)loc:@gradients/dense/MatMul_grad/MatMul_1*
T0
u
gradients/Reshape_1_grad/ShapeShapemax_pooling2d_2/MaxPool*
out_type0*
_output_shapes
:*
T0
╔
 gradients/Reshape_1_grad/ReshapeReshape4gradients/dense/MatMul_grad/tuple/control_dependencygradients/Reshape_1_grad/Shape*
Tshape0*/
_output_shapes
:         @*
T0
Ш
2gradients/max_pooling2d_2/MaxPool_grad/MaxPoolGradMaxPoolGradconv2d_2/Relumax_pooling2d_2/MaxPool gradients/Reshape_1_grad/Reshape*
ksize
*
data_formatNHWC*
strides
*
paddingVALID*/
_output_shapes
:         @*
T0
о
%gradients/conv2d_2/Relu_grad/ReluGradReluGrad2gradients/max_pooling2d_2/MaxPool_grad/MaxPoolGradconv2d_2/Relu*/
_output_shapes
:         @*
T0
Э
+gradients/conv2d_2/BiasAdd_grad/BiasAddGradBiasAddGrad%gradients/conv2d_2/Relu_grad/ReluGrad*
_output_shapes
:@*
data_formatNHWC*
T0
О
0gradients/conv2d_2/BiasAdd_grad/tuple/group_depsNoOp&^gradients/conv2d_2/Relu_grad/ReluGrad,^gradients/conv2d_2/BiasAdd_grad/BiasAddGrad
Т
8gradients/conv2d_2/BiasAdd_grad/tuple/control_dependencyIdentity%gradients/conv2d_2/Relu_grad/ReluGrad1^gradients/conv2d_2/BiasAdd_grad/tuple/group_deps*/
_output_shapes
:         @*8
_class.
,*loc:@gradients/conv2d_2/Relu_grad/ReluGrad*
T0
Л
:gradients/conv2d_2/BiasAdd_grad/tuple/control_dependency_1Identity+gradients/conv2d_2/BiasAdd_grad/BiasAddGrad1^gradients/conv2d_2/BiasAdd_grad/tuple/group_deps*
_output_shapes
:@*>
_class4
20loc:@gradients/conv2d_2/BiasAdd_grad/BiasAddGrad*
T0
~
)gradients/conv2d_2/convolution_grad/ShapeShapemax_pooling2d/MaxPool*
out_type0*
_output_shapes
:*
T0
ї
7gradients/conv2d_2/convolution_grad/Conv2DBackpropInputConv2DBackpropInput)gradients/conv2d_2/convolution_grad/Shapeconv2d_1/kernel/read8gradients/conv2d_2/BiasAdd_grad/tuple/control_dependency*
data_formatNHWC*
strides
*
paddingSAME*J
_output_shapes8
6:4                                    *
use_cudnn_on_gpu(*
T0
Д
+gradients/conv2d_2/convolution_grad/Shape_1Const*
dtype0*
_output_shapes
:*%
valueB"          @   
╓
8gradients/conv2d_2/convolution_grad/Conv2DBackpropFilterConv2DBackpropFiltermax_pooling2d/MaxPool+gradients/conv2d_2/convolution_grad/Shape_18gradients/conv2d_2/BiasAdd_grad/tuple/control_dependency*
data_formatNHWC*
strides
*
paddingSAME*&
_output_shapes
: @*
use_cudnn_on_gpu(*
T0
▒
4gradients/conv2d_2/convolution_grad/tuple/group_depsNoOp8^gradients/conv2d_2/convolution_grad/Conv2DBackpropInput9^gradients/conv2d_2/convolution_grad/Conv2DBackpropFilter
╛
<gradients/conv2d_2/convolution_grad/tuple/control_dependencyIdentity7gradients/conv2d_2/convolution_grad/Conv2DBackpropInput5^gradients/conv2d_2/convolution_grad/tuple/group_deps*/
_output_shapes
:          *J
_class@
><loc:@gradients/conv2d_2/convolution_grad/Conv2DBackpropInput*
T0
╣
>gradients/conv2d_2/convolution_grad/tuple/control_dependency_1Identity8gradients/conv2d_2/convolution_grad/Conv2DBackpropFilter5^gradients/conv2d_2/convolution_grad/tuple/group_deps*&
_output_shapes
: @*K
_classA
?=loc:@gradients/conv2d_2/convolution_grad/Conv2DBackpropFilter*
T0
о
0gradients/max_pooling2d/MaxPool_grad/MaxPoolGradMaxPoolGradconv2d/Relumax_pooling2d/MaxPool<gradients/conv2d_2/convolution_grad/tuple/control_dependency*
ksize
*
data_formatNHWC*
strides
*
paddingVALID*/
_output_shapes
:          *
T0
и
#gradients/conv2d/Relu_grad/ReluGradReluGrad0gradients/max_pooling2d/MaxPool_grad/MaxPoolGradconv2d/Relu*/
_output_shapes
:          *
T0
Щ
)gradients/conv2d/BiasAdd_grad/BiasAddGradBiasAddGrad#gradients/conv2d/Relu_grad/ReluGrad*
_output_shapes
: *
data_formatNHWC*
T0
И
.gradients/conv2d/BiasAdd_grad/tuple/group_depsNoOp$^gradients/conv2d/Relu_grad/ReluGrad*^gradients/conv2d/BiasAdd_grad/BiasAddGrad
К
6gradients/conv2d/BiasAdd_grad/tuple/control_dependencyIdentity#gradients/conv2d/Relu_grad/ReluGrad/^gradients/conv2d/BiasAdd_grad/tuple/group_deps*/
_output_shapes
:          *6
_class,
*(loc:@gradients/conv2d/Relu_grad/ReluGrad*
T0
Г
8gradients/conv2d/BiasAdd_grad/tuple/control_dependency_1Identity)gradients/conv2d/BiasAdd_grad/BiasAddGrad/^gradients/conv2d/BiasAdd_grad/tuple/group_deps*
_output_shapes
: *<
_class2
0.loc:@gradients/conv2d/BiasAdd_grad/BiasAddGrad*
T0
n
'gradients/conv2d/convolution_grad/ShapeShapeReshape*
out_type0*
_output_shapes
:*
T0
э
5gradients/conv2d/convolution_grad/Conv2DBackpropInputConv2DBackpropInput'gradients/conv2d/convolution_grad/Shapeconv2d/kernel/read6gradients/conv2d/BiasAdd_grad/tuple/control_dependency*
data_formatNHWC*
strides
*
paddingSAME*J
_output_shapes8
6:4                                    *
use_cudnn_on_gpu(*
T0
В
)gradients/conv2d/convolution_grad/Shape_1Const*
dtype0*
_output_shapes
:*%
valueB"             
┬
6gradients/conv2d/convolution_grad/Conv2DBackpropFilterConv2DBackpropFilterReshape)gradients/conv2d/convolution_grad/Shape_16gradients/conv2d/BiasAdd_grad/tuple/control_dependency*
data_formatNHWC*
strides
*
paddingSAME*&
_output_shapes
: *
use_cudnn_on_gpu(*
T0
л
2gradients/conv2d/convolution_grad/tuple/group_depsNoOp6^gradients/conv2d/convolution_grad/Conv2DBackpropInput7^gradients/conv2d/convolution_grad/Conv2DBackpropFilter
╢
:gradients/conv2d/convolution_grad/tuple/control_dependencyIdentity5gradients/conv2d/convolution_grad/Conv2DBackpropInput3^gradients/conv2d/convolution_grad/tuple/group_deps*/
_output_shapes
:         *H
_class>
<:loc:@gradients/conv2d/convolution_grad/Conv2DBackpropInput*
T0
▒
<gradients/conv2d/convolution_grad/tuple/control_dependency_1Identity6gradients/conv2d/convolution_grad/Conv2DBackpropFilter3^gradients/conv2d/convolution_grad/tuple/group_deps*&
_output_shapes
: *I
_class?
=;loc:@gradients/conv2d/convolution_grad/Conv2DBackpropFilter*
T0
b
GradientDescent/learning_rateConst*
dtype0*
_output_shapes
: *
valueB
 *oГ:
г
9GradientDescent/update_conv2d/kernel/ApplyGradientDescentApplyGradientDescentconv2d/kernelGradientDescent/learning_rate<gradients/conv2d/convolution_grad/tuple/control_dependency_1*&
_output_shapes
: *
use_locking( * 
_class
loc:@conv2d/kernel*
T0
Н
7GradientDescent/update_conv2d/bias/ApplyGradientDescentApplyGradientDescentconv2d/biasGradientDescent/learning_rate8gradients/conv2d/BiasAdd_grad/tuple/control_dependency_1*
_output_shapes
: *
use_locking( *
_class
loc:@conv2d/bias*
T0
л
;GradientDescent/update_conv2d_1/kernel/ApplyGradientDescentApplyGradientDescentconv2d_1/kernelGradientDescent/learning_rate>gradients/conv2d_2/convolution_grad/tuple/control_dependency_1*&
_output_shapes
: @*
use_locking( *"
_class
loc:@conv2d_1/kernel*
T0
Х
9GradientDescent/update_conv2d_1/bias/ApplyGradientDescentApplyGradientDescentconv2d_1/biasGradientDescent/learning_rate:gradients/conv2d_2/BiasAdd_grad/tuple/control_dependency_1*
_output_shapes
:@*
use_locking( * 
_class
loc:@conv2d_1/bias*
T0
Ф
8GradientDescent/update_dense/kernel/ApplyGradientDescentApplyGradientDescentdense/kernelGradientDescent/learning_rate6gradients/dense/MatMul_grad/tuple/control_dependency_1* 
_output_shapes
:
└А*
use_locking( *
_class
loc:@dense/kernel*
T0
К
6GradientDescent/update_dense/bias/ApplyGradientDescentApplyGradientDescent
dense/biasGradientDescent/learning_rate7gradients/dense/BiasAdd_grad/tuple/control_dependency_1*
_output_shapes	
:А*
use_locking( *
_class
loc:@dense/bias*
T0
Ы
:GradientDescent/update_dense_1/kernel/ApplyGradientDescentApplyGradientDescentdense_1/kernelGradientDescent/learning_rate8gradients/dense_2/MatMul_grad/tuple/control_dependency_1*
_output_shapes
:	А
*
use_locking( *!
_class
loc:@dense_1/kernel*
T0
С
8GradientDescent/update_dense_1/bias/ApplyGradientDescentApplyGradientDescentdense_1/biasGradientDescent/learning_rate9gradients/dense_2/BiasAdd_grad/tuple/control_dependency_1*
_output_shapes
:
*
use_locking( *
_class
loc:@dense_1/bias*
T0
є
GradientDescentNoOp:^GradientDescent/update_conv2d/kernel/ApplyGradientDescent8^GradientDescent/update_conv2d/bias/ApplyGradientDescent<^GradientDescent/update_conv2d_1/kernel/ApplyGradientDescent:^GradientDescent/update_conv2d_1/bias/ApplyGradientDescent9^GradientDescent/update_dense/kernel/ApplyGradientDescent7^GradientDescent/update_dense/bias/ApplyGradientDescent;^GradientDescent/update_dense_1/kernel/ApplyGradientDescent9^GradientDescent/update_dense_1/bias/ApplyGradientDescent
R
ArgMax/dimensionConst*
dtype0*
_output_shapes
: *
value	B :
r
ArgMaxArgMaxyArgMax/dimension*

Tidx0*#
_output_shapes
:         *
output_type0	*
T0
T
ArgMax_1/dimensionConst*
dtype0*
_output_shapes
: *
value	B :
А
ArgMax_1ArgMaxPlaceholderArgMax_1/dimension*

Tidx0*#
_output_shapes
:         *
output_type0	*
T0
N
EqualEqualArgMaxArgMax_1*#
_output_shapes
:         *
T0	
P
CastCastEqual*

SrcT0
*

DstT0*#
_output_shapes
:         
O
ConstConst*
dtype0*
_output_shapes
:*
valueB: 
W
MeanMeanCastConst*

Tidx0*
_output_shapes
: *
	keep_dims( *
T0
└
initNoOp^conv2d/kernel/Assign^conv2d/bias/Assign^conv2d_1/kernel/Assign^conv2d_1/bias/Assign^dense/kernel/Assign^dense/bias/Assign^dense_1/kernel/Assign^dense_1/bias/Assign
J
TopKV2/kConst*
dtype0*
_output_shapes
: *
value	B :

p
TopKV2TopKV2yTopKV2/k*
sorted(*:
_output_shapes(
&:         
:         
*
T0
l
Const_1Const*
dtype0*
_output_shapes
:
*1
value(B&
B0B1B2B3B4B5B6B7B8B9
V
index_to_string/SizeConst*
dtype0*
_output_shapes
: *
value	B :

]
index_to_string/range/startConst*
dtype0*
_output_shapes
: *
value	B : 
]
index_to_string/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :
Ц
index_to_string/rangeRangeindex_to_string/range/startindex_to_string/Sizeindex_to_string/range/delta*

Tidx0*
_output_shapes
:

j
index_to_string/ToInt64Castindex_to_string/range*

SrcT0*

DstT0	*
_output_shapes
:

Ы
index_to_stringHashTableV2*
shared_name *
	container *
	key_dtype0	*
value_dtype0*
use_node_name_sharing( *
_output_shapes
: 
Y
index_to_string/ConstConst*
dtype0*
_output_shapes
: *
valueB	 BUNK
z
index_to_string/table_initInitializeTableV2index_to_stringindex_to_string/ToInt64Const_1*

Tkey0	*

Tval0
Z
ToInt64CastTopKV2:1*

SrcT0*

DstT0	*'
_output_shapes
:         

Ь
index_to_string_LookupLookupTableFindV2index_to_stringToInt64index_to_string/Const*

Tout0*	
Tin0	*'
_output_shapes
:         

4
init_all_tablesNoOp^index_to_string/table_init
(
legacy_init_opNoOp^init_all_tables
P

save/ConstConst*
dtype0*
_output_shapes
: *
valueB Bmodel
Д
save/StringJoin/inputs_1Const*
dtype0*
_output_shapes
: *<
value3B1 B+_temp_ebb10da2db3c4502a9d1b63c1f68e802/part
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
	separator *
N*
_output_shapes
: 
Q
save/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
\
save/ShardedFilename/shardConst*
dtype0*
_output_shapes
: *
value	B : 
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 
╘
save/SaveV2/tensor_namesConst*
dtype0*
_output_shapes
:*З
value~B|Bconv2d/biasBconv2d/kernelBconv2d_1/biasBconv2d_1/kernelB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernel
s
save/SaveV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*#
valueBB B B B B B B B 
я
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesconv2d/biasconv2d/kernelconv2d_1/biasconv2d_1/kernel
dense/biasdense/kerneldense_1/biasdense_1/kernel*
dtypes

2
С
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*
_output_shapes
: *'
_class
loc:@save/ShardedFilename*
T0
Э
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*

axis *
_output_shapes
:*
N*
T0
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints*
_output_shapes
: *
T0
o
save/RestoreV2/tensor_namesConst*
dtype0*
_output_shapes
:* 
valueBBconv2d/bias
h
save/RestoreV2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Р
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
_output_shapes
:*
dtypes
2
а
save/AssignAssignconv2d/biassave/RestoreV2*
validate_shape(*
_output_shapes
: *
use_locking(*
_class
loc:@conv2d/bias*
T0
s
save/RestoreV2_1/tensor_namesConst*
dtype0*
_output_shapes
:*"
valueBBconv2d/kernel
j
!save/RestoreV2_1/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
_output_shapes
:*
dtypes
2
┤
save/Assign_1Assignconv2d/kernelsave/RestoreV2_1*
validate_shape(*&
_output_shapes
: *
use_locking(* 
_class
loc:@conv2d/kernel*
T0
s
save/RestoreV2_2/tensor_namesConst*
dtype0*
_output_shapes
:*"
valueBBconv2d_1/bias
j
!save/RestoreV2_2/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
_output_shapes
:*
dtypes
2
и
save/Assign_2Assignconv2d_1/biassave/RestoreV2_2*
validate_shape(*
_output_shapes
:@*
use_locking(* 
_class
loc:@conv2d_1/bias*
T0
u
save/RestoreV2_3/tensor_namesConst*
dtype0*
_output_shapes
:*$
valueBBconv2d_1/kernel
j
!save/RestoreV2_3/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
_output_shapes
:*
dtypes
2
╕
save/Assign_3Assignconv2d_1/kernelsave/RestoreV2_3*
validate_shape(*&
_output_shapes
: @*
use_locking(*"
_class
loc:@conv2d_1/kernel*
T0
p
save/RestoreV2_4/tensor_namesConst*
dtype0*
_output_shapes
:*
valueBB
dense/bias
j
!save/RestoreV2_4/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
_output_shapes
:*
dtypes
2
г
save/Assign_4Assign
dense/biassave/RestoreV2_4*
validate_shape(*
_output_shapes	
:А*
use_locking(*
_class
loc:@dense/bias*
T0
r
save/RestoreV2_5/tensor_namesConst*
dtype0*
_output_shapes
:*!
valueBBdense/kernel
j
!save/RestoreV2_5/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
_output_shapes
:*
dtypes
2
м
save/Assign_5Assigndense/kernelsave/RestoreV2_5*
validate_shape(* 
_output_shapes
:
└А*
use_locking(*
_class
loc:@dense/kernel*
T0
r
save/RestoreV2_6/tensor_namesConst*
dtype0*
_output_shapes
:*!
valueBBdense_1/bias
j
!save/RestoreV2_6/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
_output_shapes
:*
dtypes
2
ж
save/Assign_6Assigndense_1/biassave/RestoreV2_6*
validate_shape(*
_output_shapes
:
*
use_locking(*
_class
loc:@dense_1/bias*
T0
t
save/RestoreV2_7/tensor_namesConst*
dtype0*
_output_shapes
:*#
valueBBdense_1/kernel
j
!save/RestoreV2_7/shape_and_slicesConst*
dtype0*
_output_shapes
:*
valueB
B 
Ц
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
_output_shapes
:*
dtypes
2
п
save/Assign_7Assigndense_1/kernelsave/RestoreV2_7*
validate_shape(*
_output_shapes
:	А
*
use_locking(*!
_class
loc:@dense_1/kernel*
T0
Ш
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"$
legacy_init_op

legacy_init_op"3
table_initializer

index_to_string/table_init"
train_op

GradientDescent"З
trainable_variablesяь
=
conv2d/kernel:0conv2d/kernel/Assignconv2d/kernel/read:0
7
conv2d/bias:0conv2d/bias/Assignconv2d/bias/read:0
C
conv2d_1/kernel:0conv2d_1/kernel/Assignconv2d_1/kernel/read:0
=
conv2d_1/bias:0conv2d_1/bias/Assignconv2d_1/bias/read:0
:
dense/kernel:0dense/kernel/Assigndense/kernel/read:0
4
dense/bias:0dense/bias/Assigndense/bias/read:0
@
dense_1/kernel:0dense_1/kernel/Assigndense_1/kernel/read:0
:
dense_1/bias:0dense_1/bias/Assigndense_1/bias/read:0"0
losses&
$
"softmax_cross_entropy_loss/value:0"¤
	variablesяь
=
conv2d/kernel:0conv2d/kernel/Assignconv2d/kernel/read:0
7
conv2d/bias:0conv2d/bias/Assignconv2d/bias/read:0
C
conv2d_1/kernel:0conv2d_1/kernel/Assignconv2d_1/kernel/read:0
=
conv2d_1/bias:0conv2d_1/bias/Assignconv2d_1/bias/read:0
:
dense/kernel:0dense/kernel/Assigndense/kernel/read:0
4
dense/bias:0dense/bias/Assigndense/bias/read:0
@
dense_1/kernel:0dense_1/kernel/Assigndense_1/kernel/read:0
:
dense_1/bias:0dense_1/bias/Assigndense_1/bias/read:0*|
predict_imagesj
%
inputs
x:0         Р%
outputs
y:0         
tensorflow/serving/predict*╕
serving_defaultд

inputs
tf_example:0)
scores
TopKV2:0         
:
classes/
index_to_string_Lookup:0         
tensorflow/serving/classify