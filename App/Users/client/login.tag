<login>
	<div class="ui middle center aligned grid">
		<div class="column">
			<h2 class="ui image header">
				<!-- img.image -->
				<div class="content">
					Login to your account
				</div>
			</h2>
			<form class="ui large form" onsubmit="{login}">
				<div class="ui stacked segment">
					<div class="field">
						<div class="ui left icon input">
							<i class="user icon"></i>
							<input type="text" name="email" placeholder="Email address">
						</div>
					</div>
				<div class="field">
					<div class="ui left icon input">
						<i class="lock icon"></i>
						<input type="password" name="password" placeholder="Password">
					</div>
				</div>
				<button class='ui fluid large teal submit button' onclick={ login }>Login</button>
				</div>
			
				<div class="ui error message"></div>
			</form>
		</div>
	</div>

	<style>
		body>#riot-root {
			height: 100%;
		}
		.grid {
			height: 100%;
		  display: flex;
		  justify-content: center;
		  flex-direction: row;
		  align-items: center;
		}
		.column {
			max-width: 450px;
		}
		.image {
			margin-top: -100px;
		}
	</style>
	
	'use strict';
	login() {
		Meteor.loginWithPassword(
			this.email.value, 
			this.password.value, error => {
				if(error) console.log(error);
				else {
					console.log('login successful'); 
					FlowRouter.go('/');
				}
		});
	}

	register() {
		let user = {
			email: this.email.value,
			password: this.password.value
		};

		Accounts.createUser(user, error => {
			if(error) console.log(error);
			else { 
				console.log('Register successful');
				FlowRouter.go('/');
			}
		});
	}
</login>