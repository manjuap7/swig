# do not dump Octave core
if exist("crash_dumps_octave_core", "builtin")
  crash_dumps_octave_core(0);
endif

li_attribute

aa = li_attribute.A(1,2,3);

if (aa.a != 1)
  error("failed");
endif
aa.a = 3;
if (aa.a != 3)
  error("aa.a = %i",aa.a)
endif

if (aa.b != 2)
  error(aa.b)
endif
aa.b = 5;
if (aa.b != 5)
  error("failed");
endif

if (aa.d != aa.b)
  error("failed");
endif

if (aa.c != 3)
  error("failed");
endif

pi = li_attribute.Param_i(7);
if (pi.value != 7)
 error("failed");
endif

pi.value=3;
if (pi.value != 3)
 error("failed");
endif

b = li_attribute.B(aa);

if (b.a.c != 3)
 error("failed");
endif

# class/struct attribute with get/set methods using return/pass by reference
myFoo = li_attribute.MyFoo();
myFoo.x = 8;
myClass = li_attribute.MyClass();
myClass.Foo = myFoo;
if (myClass.Foo.x != 8)
  error("failed");
endif

# class/struct attribute with get/set methods using return/pass by value
myClassVal = li_attribute.MyClassVal();
if (myClassVal.ReadWriteFoo.x != -1)
  error("failed");
endif
if (myClassVal.ReadOnlyFoo.x != -1)
  error("failed");
endif
myClassVal.ReadWriteFoo = myFoo;
if (myClassVal.ReadWriteFoo.x != 8)
  error("failed");
endif
if (myClassVal.ReadOnlyFoo.x != 8)
  error("failed");
endif

# string attribute with get/set methods using return/pass by value
myStringyClass = li_attribute.MyStringyClass("initial string");
if (myStringyClass.ReadWriteString != "initial string")
  error("failed");
endif
if (myStringyClass.ReadOnlyString != "initial string")
  error("failed");
endif
myStringyClass.ReadWriteString = "changed string";
if (myStringyClass.ReadWriteString != "changed string")
  error("failed");
endif
if (myStringyClass.ReadOnlyString != "changed string")
  error("failed");
endif

