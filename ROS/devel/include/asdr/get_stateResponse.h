// Generated by gencpp from file asdr/get_stateResponse.msg
// DO NOT EDIT!


#ifndef ASDR_MESSAGE_GET_STATERESPONSE_H
#define ASDR_MESSAGE_GET_STATERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace asdr
{
template <class ContainerAllocator>
struct get_stateResponse_
{
  typedef get_stateResponse_<ContainerAllocator> Type;

  get_stateResponse_()
    : state()  {
    }
  get_stateResponse_(const ContainerAllocator& _alloc)
    : state(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _state_type;
  _state_type state;





  typedef boost::shared_ptr< ::asdr::get_stateResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::asdr::get_stateResponse_<ContainerAllocator> const> ConstPtr;

}; // struct get_stateResponse_

typedef ::asdr::get_stateResponse_<std::allocator<void> > get_stateResponse;

typedef boost::shared_ptr< ::asdr::get_stateResponse > get_stateResponsePtr;
typedef boost::shared_ptr< ::asdr::get_stateResponse const> get_stateResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::asdr::get_stateResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::asdr::get_stateResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::asdr::get_stateResponse_<ContainerAllocator1> & lhs, const ::asdr::get_stateResponse_<ContainerAllocator2> & rhs)
{
  return lhs.state == rhs.state;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::asdr::get_stateResponse_<ContainerAllocator1> & lhs, const ::asdr::get_stateResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace asdr

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::asdr::get_stateResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::asdr::get_stateResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::asdr::get_stateResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::asdr::get_stateResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::asdr::get_stateResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::asdr::get_stateResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::asdr::get_stateResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "af6d3a99f0fbeb66d3248fa4b3e675fb";
  }

  static const char* value(const ::asdr::get_stateResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xaf6d3a99f0fbeb66ULL;
  static const uint64_t static_value2 = 0xd3248fa4b3e675fbULL;
};

template<class ContainerAllocator>
struct DataType< ::asdr::get_stateResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "asdr/get_stateResponse";
  }

  static const char* value(const ::asdr::get_stateResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::asdr::get_stateResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string state\n"
;
  }

  static const char* value(const ::asdr::get_stateResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::asdr::get_stateResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.state);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct get_stateResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::asdr::get_stateResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::asdr::get_stateResponse_<ContainerAllocator>& v)
  {
    s << indent << "state: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.state);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ASDR_MESSAGE_GET_STATERESPONSE_H
