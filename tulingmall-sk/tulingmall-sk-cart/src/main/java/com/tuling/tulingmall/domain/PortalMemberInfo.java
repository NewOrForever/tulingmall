package com.tuling.tulingmall.domain;

import com.tuling.tulingmall.model.UmsMember;
import com.tuling.tulingmall.model.UmsMemberLevel;
import lombok.Data;

@Data
public class PortalMemberInfo extends UmsMember {
    private UmsMemberLevel umsMemberLevel;
}
