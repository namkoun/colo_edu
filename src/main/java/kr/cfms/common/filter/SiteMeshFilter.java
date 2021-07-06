package kr.cfms.common.filter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.sitemesh.content.tagrules.html.Sm2TagRuleBundle;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SiteMeshFilter extends ConfigurableSiteMeshFilter {

    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder.addTagRuleBundle(new Sm2TagRuleBundle())
                .addDecoratorPath("/login/*", "/layout/layoutLogin.jsp")
                .addDecoratorPath("/*", "/layout/layoutCommon.jsp");
    }
}
