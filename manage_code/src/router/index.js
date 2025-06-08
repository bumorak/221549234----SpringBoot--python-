	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import minsuxinxi from '@/views/minsuxinxi/list'
	import systemintro from '@/views/systemintro/list'
	import yonghu from '@/views/yonghu/list'
	import minsuleixing from '@/views/minsuleixing/list'
	import storeup from '@/views/storeup/list'
	import config from '@/views/config/list'
	import discussminsuxinxi from '@/views/discussminsuxinxi/list'
	import users from '@/views/users/list'
	import minsuyuding from '@/views/minsuyuding/list'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/minsuxinxi',
			name: '民宿信息',
			component: minsuxinxi
		}
		,{
			path: '/systemintro',
			name: '网站介绍',
			component: systemintro
		}
		,{
			path: '/yonghu',
			name: '用户',
			component: yonghu
		}
		,{
			path: '/minsuleixing',
			name: '民宿类型',
			component: minsuleixing
		}
		,{
			path: '/storeup',
			name: '我的收藏',
			component: storeup
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		,{
			path: '/discussminsuxinxi',
			name: '民宿信息评论',
			component: discussminsuxinxi
		}
		,{
			path: '/users',
			name: '管理员',
			component: users
		}
		,{
			path: '/minsuyuding',
			name: '民宿预订',
			component: minsuyuding
		}
		]
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
