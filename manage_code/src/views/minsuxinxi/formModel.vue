<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="12">
						<el-form-item label="房间名称" prop="fangjianmingcheng">
							<el-input class="list_inp" v-model="form.fangjianmingcheng" placeholder="房间名称"
								 type="text" 								:readonly="!isAdd||disabledForm.fangjianmingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="房间图片" prop="fangjiantupian">
							<uploads
								:disabled="!isAdd||disabledForm.fangjiantupian?true:false"
								action="file/upload" 
								tip="请上传房间图片" 
								:limit="3" 
								style="width: 100%;text-align: left;"
								:fileUrls="form.fangjiantupian?form.fangjiantupian:''" 
								@change="fangjiantupianUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="房间类型" prop="fangjianleixing">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.fangjianleixing?true:false"
								v-model="form.fangjianleixing" 
								placeholder="请选择房间类型"
								>
								<el-option v-for="(item,index) in fangjianleixingLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="一晚价格" prop="yiwanjiage">
							<el-input class="list_inp" v-model.number="form.yiwanjiage" placeholder="一晚价格"
								 type="number" 								:readonly="!isAdd||disabledForm.yiwanjiage?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="服务电话" prop="fuwudianhua">
							<el-input class="list_inp" v-model="form.fuwudianhua" placeholder="服务电话"
								 type="text" 								:readonly="!isAdd||disabledForm.fuwudianhua?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="民宿名称" prop="minsumingcheng">
							<el-input class="list_inp" v-model="form.minsumingcheng" placeholder="民宿名称"
								 type="text" 								:readonly="!isAdd||disabledForm.minsumingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="民宿地址" prop="minsudizhi">
							<el-input class="list_inp" v-model="form.minsudizhi" placeholder="民宿地址"
								 type="text" 								:readonly="!isAdd||disabledForm.minsudizhi?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="民宿类型" prop="minsuleixing">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.minsuleixing?true:false"
								v-model="form.minsuleixing" 
								placeholder="请选择民宿类型"
								>
								<el-option v-for="(item,index) in minsuleixingLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="房内设施" prop="fangneisheshi">
							<editor :value="form.fangneisheshi" placeholder="请输入房内设施" :readonly="!isAdd||disabledForm.fangneisheshi?true:false"
								class="list_editor" @change="(e)=>editorChange(e,'fangneisheshi')"></editor>
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="formModel_cancel" @click="closeClick">取消</el-button>
					<el-button class="formModel_confirm" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'minsuxinxi'
	const formName = '民宿信息'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		fangjianmingcheng : false,
		fangjiantupian : false,
		fangjianleixing : false,
		yiwanjiage : false,
		fuwudianhua : false,
		fangneisheshi : false,
		storeupnum : false,
		minsumingcheng : false,
		minsudizhi : false,
		minsuleixing : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		fangjianmingcheng: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		fangjiantupian: [
		],
		fangjianleixing: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		yiwanjiage: [
			{required: true,message: '请输入',trigger: 'blur'}, 
			{ validator: validateNumber, trigger: 'blur' },
		],
		fuwudianhua: [
			{ validator: validatePhone, trigger: 'blur' },
		],
		fangneisheshi: [
		],
		storeupnum: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		minsumingcheng: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		minsudizhi: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		minsuleixing: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//房间图片上传回调
	const fangjiantupianUploadSuccess=(e)=>{
		form.value.fangjiantupian = e
	}
	//房间类型列表
	const fangjianleixingLists = ref([])
	//民宿类型列表
	const minsuleixingLists = ref([])
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			fangjianmingcheng: '',
			fangjiantupian: '',
			fangjianleixing: '',
			yiwanjiage: '',
			fuwudianhua: '',
			fangneisheshi: '',
			storeupnum: '0',
			minsumingcheng: '',
			minsudizhi: '',
			minsuleixing: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			res.data.data.fangneisheshi = res.data.data.fangneisheshi?(res.data.data.fangneisheshi.replace(reg,'../../../cl3338746/file')):'';
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='fangjianmingcheng'){
					form.value.fangjianmingcheng = row[x];
					disabledForm.value.fangjianmingcheng = true;
					continue;
				}
				if(x=='fangjiantupian'){
					form.value.fangjiantupian = row[x];
					disabledForm.value.fangjiantupian = true;
					continue;
				}
				if(x=='fangjianleixing'){
					form.value.fangjianleixing = row[x];
					disabledForm.value.fangjianleixing = true;
					continue;
				}
				if(x=='yiwanjiage'){
					form.value.yiwanjiage = row[x];
					disabledForm.value.yiwanjiage = true;
					continue;
				}
				if(x=='fuwudianhua'){
					form.value.fuwudianhua = row[x];
					disabledForm.value.fuwudianhua = true;
					continue;
				}
				if(x=='fangneisheshi'){
					form.value.fangneisheshi = row[x];
					disabledForm.value.fangneisheshi = true;
					continue;
				}
				if(x=='storeupnum'){
					form.value.storeupnum = row[x];
					disabledForm.value.storeupnum = true;
					continue;
				}
				if(x=='minsumingcheng'){
					form.value.minsumingcheng = row[x];
					disabledForm.value.minsumingcheng = true;
					continue;
				}
				if(x=='minsudizhi'){
					form.value.minsudizhi = row[x];
					disabledForm.value.minsudizhi = true;
					continue;
				}
				if(x=='minsuleixing'){
					form.value.minsuleixing = row[x];
					disabledForm.value.minsuleixing = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			form.value.storeupnum='0'
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
		})
		fangjianleixingLists.value = "单人间,大床房,双人间,三人间,标准套间,豪华套间".split(',')
		context?.$http({
			url: `option/minsuleixing/minsuleixing`,
			method: 'get'
		}).then(res=>{
			minsuleixingLists.value = res.data.data
		})
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		if(form.value.fangjiantupian!=null) {
			form.value.fangjiantupian = form.value.fangjiantupian.replace(new RegExp(context?.$config.url,"g"),"");
		}
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									formVisible.value = false
									emit('formModelChange')
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							formVisible.value = false
							emit('formModelChange')
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		border-radius: 6px;
		padding: 30px;
		box-shadow: 0 0px 0px rgba(85, 255, 255, 0.5);
		// form item
		:deep(.el-form-item) {
			border: 1px solid #ddd;
			margin: 0;
			display: flex;
			//label
			.el-form-item__label {
			 border: 1px solid #ddd;
			 padding: 0;
			 background: rgba(236,236,236,1);
			 display: block;
			 width: 120px;
			 border-width: 0 2px 0 0;
			 text-align: center;
			}
			// 内容盒子
			.el-form-item__content {
				padding: 0 20px;
				display: flex;
				width: calc(100% - 120px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					border: 1px solid #ddd;
					box-shadow: 0 0 0px rgba(85, 255, 255, 0.5);
					padding: 0 10px;
					width: 100%;
					line-height: 36px;
					box-sizing: border-box;
					height: 36px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
						padding: 0;
					}
					.is-focus {
						box-shadow: none !important;
					}
				}
				// 下拉框
				.list_sel {
					border: 1px solid #ddd;
					border-radius: 0;
					box-shadow: 0 0 0px rgba(85, 255, 255, 0.5);
					padding: 0 10px;
					width: 100%;
					line-height: 36px;
					box-sizing: border-box;
					//去掉默认样式
					.select-trigger{
						height: 100%;
						.el-input{
							height: 100%;
							.el-input__wrapper{
								border: none;
								box-shadow: none;
								background: none;
								border-radius: 0;
								height: 100%;
								padding: 0;
							}
							.is-focus {
								box-shadow: none !important;
							}
						}
					}
				}
				// 富文本
				.list_editor {
					background-color: #fff;
					border-radius: 0;
					padding: 0;
					box-shadow: 0 0 0px rgba(85, 255, 255, 0.5);
					margin: 0;
					width: 100%;
					border-color: #ddd;
					border-width: 0;
					border-style: solid;
					height: auto;
				}
				//图片上传样式
				.el-upload-list  {
					//提示语
					.el-upload__tip {
						margin: 7px 0 0;
						color: #999;
						display: flex;
						font-size: 12px;
						justify-content: flex-start;
						align-items: center;
					}
					//外部盒子
					.el-upload--picture-card {
						border: 1px dashed #000;
						cursor: pointer;
						background-color: #fff;
						border-radius: 8px;
						width: 100px;
						line-height: 110px;
						text-align: center;
						height: 100px;
						//图标
						.el-icon{
							color: #000;
							font-size: 32px;
						}
					}
					.el-upload-list__item {
						border: 1px dashed #000;
						cursor: pointer;
						background-color: #fff;
						border-radius: 8px;
						width: 100px;
						line-height: 110px;
						text-align: center;
						height: 100px;
					}
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		padding: 40px 0 0;
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: center;
		.formModel_cancel {
			border: 0;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 24px;
			margin: 0 10px 0 0;
			outline: none;
			color: #fff;
			background: rgba(27, 78, 133, 1);
			width: auto;
			font-size: 14px;
			height: 32px;
		}
		.formModel_cancel:hover {
			background: rgba(27, 78, 133, 0.5);
		}
		
		.formModel_confirm {
			border: 0;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 24px;
			margin: 0 10px 0 0;
			outline: none;
			color: #fff;
			background: rgba(241, 49, 100, 1);
			width: auto;
			font-size: 14px;
			height: 32px;
		}
		.formModel_confirm:hover {
			background: rgba(241, 49, 100, .5);
		}
	}
</style>