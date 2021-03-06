package org.unidal.cat.document;

import org.unidal.initialization.AbstractModule;
import org.unidal.initialization.Module;
import org.unidal.initialization.ModuleContext;

import com.dianping.cat.CatCoreModule;

public class CatDocumentModule extends AbstractModule {
	public static final String ID = "cat-core-document";

	@Override
	public Module[] getDependencies(ModuleContext ctx) {
		return ctx.getModules(CatCoreModule.ID);
	}

	@Override
	protected void execute(ModuleContext ctx) throws Exception {
		
	}
}
